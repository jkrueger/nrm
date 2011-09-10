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
endif

all_targets :=

define SUBDIR
dir := $(strip $1)
include $(strip $1)/rules.mk
endef

BUILD_DIR = $(OS)-$(ARCH)

define KAPUTTES_SYSTEM
@echo A dependency graph inconsistency has been detected while building $@
@echo from $<. Aborting
@exit -1
endef

$(BUILD_DIR):
	$(CHATTY)mkdir -p $@

%.o: %.cpp
	KAPUTTES_SYSTEM

%.o: %.c
	KAPUTTES_SYSTEM
