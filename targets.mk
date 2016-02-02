all: $(all_targets)

clean:
	$(CHATTY)rm -fr $(all_targets)
	$(CHATTY)rm -fr $(all_objects)
	@if [ -n "`find $(BUILD_DIR) -type f`" ]; then \
            echo Incomplete dependencies detected. The reliability of the \
            system can not be ; \
            echo guaranteed. Untracked objects:;\
            find $(BUILD_DIR) -type f; \
        fi;

.PHONY: all clean
