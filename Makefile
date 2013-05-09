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
NEWTAG=.$(WHICH)-new-tag
TAG=.$(WHICH)-tag
REPO=$(WHICH)/.git
BUILD=$(ROOT)/build/$(WHICH)
CONFIG=$(ROOT)/$(WHICH)/configure
LOG=$(BUILD)/log

all: $(LIBRARIES)

update: $(LIBRARIES)
	for i in $(LIBRARIES); do \
	  $(MAKE) pull-this WHICH=$$i; \
	  $(MAKE) update-this WHICH=$$i; \
	done

build-this: $(BUILD)

$(BUILD): $(CONFIG)
	rm -rf $(BUILD)
	mkdir -p $(BUILD)
	PATH=$(BINDIR):$$PATH; \
	cd $(BUILD) && \
	../$(WHICH)/configure --prefix=$HOME \
	   --disable-shared \
	   LDFLAGS="$(LDFLAGS) -L$(LIBDIR) -W,-l,-rpath,$(LIBDIR)" \
	   CPPFLAGS="$(CPPFLAGS) -I$(INCLUDEDIR)" 2>&1 | tee $(LOG)
	PATH=$(BINDIR):$$PATH; \
	$(MAKE) -C $(BUILD) install 2>&1 | tee -a $(LOG)

$(CONFIG): $(TAG)
	cd $(WHICH) && ./autogen.sh

pull-this: $(REPO)
	cd $(WHICH) && \
	git reset --hard && \
	git pull

update-this: $(WHICH)
	git --git-dir=$(REPO) log -1 > $(NEWTAG)
	if [ -f $(TAG) ]; then \
	  if diff $(TAG) $(NEWTAG); then \
	    echo Library updated; \
	    rm $(TAG); mv $(NEWTAG) $(TAG); \
	  else \
	    echo Library needs no update; \
	  fi; \
	else \
	   mv $(NEWTAG) $(TAG); \
	fi
	rm -f $(WHICH)/$(NEWTAG)

$(LIBRARIES):
	git clone http://github.com/juanjosegarciaripoll/$@

distclean:
	rm -rf $(LIBRARIES) build bin shared lib include
