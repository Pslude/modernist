GODOT = godot --headless
PROJECT_DIR = project
BUILD_DIR = build
EXE = Modernist.x86_64
MODS_DIR = mods

MODS = $(notdir $(wildcard $(MODS_DIR)/*))

all: $(BUILD_DIR) $(BUILD_DIR)/$(EXE) mods

$(BUILD_DIR):
	mkdir -p $@

$(BUILD_DIR)/$(EXE):
	$(GODOT) --path $(PROJECT_DIR) --export-release linux $(CURDIR)/$@

mods: $(BUILD_DIR)/mods
	@for mod in $(MODS); do \
		echo "Building mod: $$mod"; \
		$(MAKE) -C $(MODS_DIR)/$$mod; \
		echo "Copying $$mod mod pack to $(BUILD_DIR)/mods"; \
		cp $(MODS_DIR)/$$mod/build/*.pck $(BUILD_DIR)/mods/; \
	done

$(BUILD_DIR)/mods:
	mkdir -p $@

clean: clean_mods
	rm -rf $(BUILD_DIR)

clean_mods:
	@for mod in $(MODS); do \
		$(MAKE) -C $(MODS_DIR)/$$mod clean; \
	done

help:
	@echo "Usage: make {all|clean|help|mods}" 1>&2 && false

.PHONY: all clean clean_mods help mods