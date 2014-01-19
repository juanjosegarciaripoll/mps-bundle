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
TAG=$(ROOT)/lib/.$(WHICH)-tag
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
	if [ -d cblapack ]; then config="--with-cblapack";  make build-cblapack; fi; \
	$(MAKE) build-this WHICH=tensor CONFIG_FLAGS="$$config"
build-cblapack: build-f2c
	$(MAKE) build-this WHICH=cblapack
build-f2c: f2c
	$(MAKE) build-this WHICH=f2c

#
# Ensure git is up-to-date
#
update: $(LIBRARIES)
	for i in $(LIBRARIES) cblapack; do \
	  if test -d $$i; then \
	    $(MAKE) pull-this WHICH=$$i; \
	  fi \
	done

pull-this: $(REPO)
	test "x$(WHICH)" != "x"
	cd $(WHICH) && \
	git reset --hard && \
	git pull

#
# Build only if version has changed or the tag file is absent
#
build-this:
	test "x$(WHICH)" != "x"
	git --git-dir=$(REPO) log -1 > $(NEWTAG) || date > $(NEWTAG); \
	echo %%%; echo %%% Current version; echo %%%; cat $(NEWTAG); \
	if [ -f $(TAG) ]; then \
	  echo %%%; echo %%% Last build ; echo %%%; cat $(TAG); \
	  if diff $(TAG) $(NEWTAG); then \
	    echo %%% ; \
	    echo %%% Library $(WHICH) needs no rebuilding; \
	    echo %%% ; \
	  else \
	    echo %%% ; \
	    echo %%% Library $(WHICH) must be rebuilt; \
	    echo %%% ; \
	    rm $(TAG); mv $(NEWTAG) $(TAG); \
	    (cd $(WHICH) && ./autogen.sh); \
	    make do-build WHICH=$(WHICH) 2>&1 | tee $(LOG); \
	  fi; \
	else \
	  echo %%%; \
	  echo %%% First time build of $(WHICH) ; \
	  echo %%%; \
	  mv $(NEWTAG) $(TAG); \
	  (cd $(WHICH) && ./autogen.sh); \
	  make do-build WHICH=$(WHICH) 2>&1 | tee $(LOG); \
	fi; \
	rm -f $(NEWTAG)

do-build:
	test "x$(WHICH)" != "$(WHICH)"
	rm -rf $(BUILD) $(NOTAG)
	mkdir -p $(BUILD)
	mv $(TAG) $(NOTAG)
	PATH=$(BINDIR):$$PATH; \
	  . $(ROOT)/scripts/mps_env.sh $(WHICH); \
	  set && \
	  cd $(BUILD) && \
	  $(CONFIG) --prefix=$(ROOT) --disable-shared $(CONFIG_FLAGS) \
	    LDFLAGS="$(LDFLAGS) $$LDFLAGS -L$(LIBDIR) -Wl,-rpath,$(LIBDIR)" \
	    CPPFLAGS="$(CPPFLAGS) $$CPPFLAGS -I$(INCLUDEDIR)" \
	    LIBS="$(LIBS) $$LIBS"
	PATH=$(BINDIR):$$PATH; \
	  . $(ROOT)/scripts/mps_env.sh $(WHICH); \
	  $(MAKE) -C $(BUILD) install
	-$(MAKE) -C $(BUILD) install-doxygen-doc
	mv $(NOTAG) $(TAG)

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
	   if [ -d cblapack ]; then extras="cblapack"; fi; \
	   rsync -rauvz --delete script* Makefile README $(LIBRARIES) \
		$$extras project* $(DEST):mps-bundle ; \
	fi

upload-doc: build
	rsync -rauvz --delete share/doc/* $DEST
