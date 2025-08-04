GODOT = godot --headless
PROJECT_DIR = project
BUILD_DIR = build
EXE = Modernist.x86_64

all: $(BUILD_DIR) $(BUILD_DIR)/$(EXE)

$(BUILD_DIR):
	mkdir -p $@

$(BUILD_DIR)/$(EXE):
	$(GODOT) --path $(PROJECT_DIR) --export-release linux $(CURDIR)/$@

clean:
	rm -rf $(BUILD_DIR)

help:
	@echo "Usage: make {all|clean|help}" 1>&2 && false

.PHONY: all clean help

