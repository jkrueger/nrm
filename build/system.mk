TOP := $(shell pwd)

all:

ifndef OS
OS  := $(shell uname)
endif

ifndef ARCH
ARCH := i386
endif

ifndef CHATTY
CHATTY  := @
else
CHATTY  :=
endif

BUILD_DIR = $(OS)-$(ARCH)

all_targets :=
all_objects :=

define SUBDIR
dir := $(strip $1)
include $(strip $1)/rules.mk
endef

define CXX_RECIPE
	@echo [C++] $$^
	$(CHATTY)$(CXX) $(CXX_GLOBAL_FLAGS) $$(cxx_local_flags) -c $$^ -o $$@
endef

define LD_RECIPE
	@echo [LD ] $$@
	$(CHATTY)$(CXX) $(LD_GLOBAL_FLAGS) $$(ld_local_flags) $$^ -o $$@
endef

define KAPUTTES_SYSTEM
@echo A dependency graph inconsistency has been detected while building $@
@echo from $<. Aborting
@exit -1
endef

$(BUILD_DIR):
	$(CHATTY)mkdir -p $@

%.o: %.cpp
	$(KAPUTTES_SYSTEM)

%.o: %.c
	$(KAPUTTES_SYSTEM)
