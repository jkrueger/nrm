define APFELKUCHEN_REZEPTE
    __t := $(strip $1)
    $$(__t)_objects_$(d) := $$($$(__t)_sources_$(d):%.cpp=%.o)
    $$(__t)_objects_$(d) := $$($$(__t)_objects_$(d):%.c=%.o)
    $$(__t)_objects_$(d) := $$($$(__t)_objects_$(d):%=$(BUILD_DIR)/$(d)/%)
    __odir := $(BUILD_DIR)/$(d)
    __tdir := $(BUILD_DIR)/$($(strip $1)_target_dir_$(d))
    __qtgt := $$(__tdir)/$$(__t)
    $$(__odir) $$(__tdir)::
	$(CHATTY)mkdir -p $$@
    $$(__qtgt): $$($$(__t)_objects_$(d)) | $$(__tdir)
	$(LD_RECIPE)
    $$(__qtgt): cxx_local_flags := $$($$(__t)_cxx_flags_$(d))
    $$(__qtgt): ld_local_flags  := $$($$(__t)_ld_flags_$(d))
    $$(__odir)/%.o: $(d)/%.cpp | $$(__odir)
	$(CXX_RECIPE)
    all_targets += $$(__qtgt)
    all_objects += $$($$(__t)_objects_$(d))
endef

$(foreach target,$(targets_$(d)), \
    $(eval \
        $(call APFELKUCHEN_REZEPTE, $(target)))\
)

d   := $(stack_$(sp))
sp  := $(basename $(sp))
