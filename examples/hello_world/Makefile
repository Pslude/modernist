GODOT = godot --headless
PROJECT_DIR = project
BUILD_DIR = build

PCK := $(notdir $(CURDIR)).pck
#PRESETS := linux windows
#PCKS := $(PRESETS:%=$(BUILD_DIR)/$(PCK)_%.pck)

all: $(BUILD_DIR) $(BUILD_DIR)/$(PCK)

$(BUILD_DIR):
	mkdir -p $@

$(BUILD_DIR)/$(PCK):
	$(GODOT) --path $(PROJECT_DIR) --export-pack linux $(CURDIR)/$@

clean:
	rm -rf $(BUILD_DIR)

help:
	@echo "Usage: make {all|clean|help}" 1>&2 && false

.PHONY: all clean help

