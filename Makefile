LIBRARIES=f2c tensor mps

# Installation
ROOT=$(CURDIR)
LIBDIR=$(ROOT)/lib
INCLUDEDIR=$(ROOT)/include
BINDIR=$(ROOT)/bin
LDFLAGS=
CPPFLAGS=

#
# For rules that act on specific libraries
#
WHICH=f2c
REPO=$(ROOT)/$(WHICH)/.git
BUILD=$(ROOT)/build/$(WHICH)
CONFIG=$(ROOT)/$(WHICH)/configure
#
# Temporary files
#
TAG=$(ROOT)/.$(WHICH)-tag
NEWTAG=$(TAG)-new
NOTAG=$(TAG)-no
LOG=$(BUILD)/log

.PHONY: all build update build-this pull-this update-this

all: $(LIBRARIES)

build: $(LIBRARIES)
	for i in $(LIBRARIES); do $(MAKE) build-this WHICH=$$i; done

update: $(LIBRARIES)
	for i in $(LIBRARIES); do \
	  $(MAKE) pull-this WHICH=$$i; \
	  $(MAKE) update-this WHICH=$$i; \
	done

build-this: $(BUILD)/Makefile

$(BUILD)/Makefile: $(CONFIG)
	rm -rf $(BUILD)
	mkdir -p $(BUILD)
	mv $(TAG) $(NOTAG)
	PATH=$(BINDIR):$$PATH; \
	cd $(BUILD) && \
	$(CONFIG) --prefix=$(ROOT) --disable-shared \
	   LDFLAGS="$(LDFLAGS) -L$(LIBDIR) -Wl,-rpath,$(LIBDIR)" \
	   CPPFLAGS="$(CPPFLAGS) -I$(INCLUDEDIR)" 2>&1 | tee $(LOG)
	PATH=$(BINDIR):$$PATH; \
	$(MAKE) -C $(BUILD) install 2>&1 | tee -a $(LOG)
	mv $(NOTAG) $(TAG)

$(CONFIG): $(TAG)
	cd $(WHICH) && ./autogen.sh

pull-this: $(REPO)
	cd $(WHICH) && \
	git reset --hard && \
	git pull

$(TAG): update-this
update-this: $(WHICH)
	git --git-dir=$(REPO) log -1 > $(NEWTAG)
	if [ -f $(TAG) ]; then \
	  if diff $(TAG) $(NEWTAG); then \
	    echo *** ; \
	    echo *** Library $(WHICH) needs no update; \
	    echo *** ; \
	  else \
	    echo *** ; \
	    echo *** Library $(WHICH) updated; \
	    echo *** ; \
	    rm $(TAG); mv $(NEWTAG) $(TAG); \
	  fi; \
	else \
	  echo ***; \
	  echo *** First time build of $(WHICH) ; \
	  echo ***; \
	  mv $(NEWTAG) $(TAG); \
	fi
	rm -f $(NEWTAG)

$(LIBRARIES):
	git clone http://github.com/juanjosegarciaripoll/$@

clean:
	rm -rf build

distclean:
	rm -rf $(LIBRARIES) build bin shared lib include .*-tag*
