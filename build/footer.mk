define APFELKUCHEN_REZEPTE
    __t := $(strip $1)
    __t := $(strip $1)
    $$(__t)_objects_$(d) := $$($$(__t)_sources_$(d):%.cpp=%.o)
    $$(__t)_objects_$(d) := $$($$(__t)_objects_$(d):%.c=%.o)
    $$(__t)_objects_$(d) := $$($$(__t)_objects_$(d):%=$(BUILD_DIR)/$(d)/%)
    __qt := $(BUILD_DIR)/$($(strip $1)_target_dir_$(d))/$$(__t)
   $$(__qt): $$($$(__t)_objects_$(d))
	$(CHATTY)mkdir -p $$(dir $$@)
	$$(LD) -o $$@ $$^ 
    all_targets += $$(__qt)
endef

$(foreach target,$(targets_$(d)), \
    $(eval \
        $(call APFELKUCHEN_REZEPTE, $(target)))\
)

d   := $(stack_$(sp))
sp  := $(basename $(sp))
