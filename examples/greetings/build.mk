include $(TOP)/build/header.mk

products_$(d) := helloworld goodbyeworld

helloworld_precompiled_header_$(d) := helloworld.hpp
helloworld_sources_$(d)     := helloworld.cpp
helloworld_target_dir_$(d)  := bin
helloworld_cxx_flags_$(d)   := -O2
helloworld_ld_flags_$(d)    := 

goodbyeworld_precompiled_header_$(d) := goodbyeworld.hpp
goodbyeworld_sources_$(d)   := goodbyeworld.cpp
goodbyeworld_target_dir_$(d):= bin
goodbyeworld_cxx_flags_$(d) := -g -O0
goodbyeworld_ld_flags_$(d)  := 

include $(TOP)/build/footer.mk
