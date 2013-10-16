LIBRARIES=f2c tensor mps

#
# Installation
#
ROOT=$(CURDIR)
LIBDIR=$(ROOT)/lib
INCLUDEDIR=$(ROOT)/include
BINDIR=$(ROOT)/bin
#
# Configuration flags, filled in by scripts/mps_env.sh
#
LDFLAGS=
CPPFLAGS=
LIBS=
#
# For rules that act on specific libraries
#
WHICH=f2c
REPO=$(ROOT)/$(WHICH)/.git
BUILD=$(ROOT)/build/$(WHICH)
CONFIG=$(ROOT)/$(WHICH)/configure
CONFIG_FLAGS=
#
# Temporary files
#
TAG=$(ROOT)/.$(WHICH)-tag
NEWTAG=$(TAG)-new
NOTAG=$(TAG)-no
LOG=$(BUILD)/log

.PHONY: all build update build-this pull-this update-this \
	build-f2c build-cblapack build-tensor build-mps clean distclean

all: $(LIBRARIES)

build: build-f2c build-tensor build-mps

build-mps: build-tensor mps
	$(MAKE) build-this WHICH=mps
build-tensor: build-f2c tensor
	if [ -d cblapack ]; then config="--with-cblapack";  make build-cblapack; fi
	$(MAKE) build-this WHICH=tensor CONFIG_FLAGS="--with-cblapack"
build-cblapack: build-f2c
	$(MAKE) build-this WHICH=cblapack
build-f2c: f2c
	$(MAKE) build-this WHICH=f2c

update: $(LIBRARIES)
	for i in $(LIBRARIES) cblapack; do \
	  if test -d $$i; then \
	    $(MAKE) pull-this WHICH=$$i; \
	    $(MAKE) update-this WHICH=$$i; \
	  fi \
	done

build-this: $(BUILD)/Makefile

#
# Not so obvious inter-dependencies
#

$(BUILD)/Makefile: $(CONFIG) $(TAG)
	rm -rf $(BUILD)
	mkdir -p $(BUILD)
	mv $(TAG) $(NOTAG)
	PATH=$(BINDIR):$$PATH; \
	. $(ROOT)/scripts/mps_env.sh $(WHICH); \
	(set && \
	 cd $(BUILD) && \
	 $(CONFIG) --prefix=$(ROOT) --disable-shared $(CONFIG_FLAGS) \
	   LDFLAGS="$(LDFLAGS) $$LDFLAGS -L$(LIBDIR) -Wl,-rpath,$(LIBDIR)" \
	   CPPFLAGS="$(CPPFLAGS) $$CPPFLAGS -I$(INCLUDEDIR)" \
	   LIBS="$(LIBS) $$LIBS" \
	   2>&1) | tee $(LOG)
	PATH=$(BINDIR):$$PATH; \
	. $(ROOT)/scripts/mps_env.sh $(WHICH); \
	$(MAKE) -C $(BUILD) install 2>&1 | tee -a $(LOG)
	-$(MAKE) -C $(BUILD) install-doxygen-doc 2>&1 | tee -a $(LOG)
	mv $(NOTAG) $(TAG)

pull-this: $(REPO)
	cd $(WHICH) && \
	git reset --hard && \
	git pull

$(TAG): update-this
update-this: $(WHICH)
	git --git-dir=$(REPO) log -1 > $(NEWTAG) || date > $(NEWTAG)
	if [ -f $(TAG) ]; then \
	  if diff $(TAG) $(NEWTAG); then \
	    echo %%% ; \
	    echo %%% Library $(WHICH) needs no update; \
	    echo %%% ; \
	  else \
	    echo %%% ; \
	    echo %%% Library $(WHICH) updated; \
	    echo %%% ; \
	    rm $(TAG); mv $(NEWTAG) $(TAG); \
	    (cd $(WHICH) && ./autogen.sh); \
	  fi; \
	else \
	  echo %%%; \
	  echo %%% First time build of $(WHICH) ; \
	  echo %%%; \
	  mv $(NEWTAG) $(TAG); \
	  (cd $(WHICH) && ./autogen.sh); \
	fi
	rm -f $(NEWTAG)

$(LIBRARIES) cblapack:
	git clone https://github.com/juanjosegarciaripoll/$@
	cd $@ && ./autogen.sh

clean:
	rm -rf bin build include lib shared .*-tag*

distclean: clean
	rm -rf $(LIBRARIES) cblapack

DEST=
upload: $(LIBRARIES)
	if [ -z "$(DEST)" ]; then \
	   echo Please specify a cluster through the variable DEST; \
	else \
	   if [ -d cblapack ]; then extras="cblapack"; fi
	   rsync -rauvz --delete script* Makefile README $(LIBRARIES) \
		$extras project* $(DEST):mps-bundle ; \
	fi

upload-doc: build
	rsync -rauvz --delete share/doc/* $DEST
