include $(TOP)/build/header.mk

targets_$(d)    := helloworld goodbyeworld

helloworld_sources_$(d)     := helloworld.cpp
helloworld_target_dir_$(d)  := bin

goodbyeworld_sources_$(d)   := goodbyeworld.cpp
goodbyeworld_target_dir_$(d):= bin

include $(TOP)/build/footer.mk
