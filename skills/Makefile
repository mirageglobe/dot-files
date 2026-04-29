# ================================================================ info ===== #
# skills management makefile

# ------------------------------------------------------------ settings ----- #

.DEFAULT_GOAL := help

CYAN  := \033[36m
RESET := \033[0m
BOLD  := \033[1m

SKILLS := architect caveman cove ironbeard the-beard

# ------------------------------------------------------------ functions ----- #

define print_status
	@printf "$(CYAN)==> $(1)$(RESET)\n"
endef

# ================================================================ targets === #

help: ## display this help menu
	@printf "\n$(BOLD)Usage:$(RESET)\n  make $(CYAN)<target>$(RESET)\n"
	@awk 'BEGIN { FS = ":.*##"; } \
		/^[a-zA-Z0-9_-]+:.*?##/ { printf "  $(CYAN)%-30s$(RESET) %s\n", $$1, $$2; } \
		/^##@/ { printf "\n$(BOLD)%s$(RESET)\n", substr($$0, 5); }' $(MAKEFILE_LIST)

deploy: ## deploy all skills to Claude, OpenCode, and Gemini global config directories
	$(call print_status,Deploying skills to Claude, OpenCode, and Gemini)
	@for skill in $(SKILLS); do \
		mkdir -p ~/.claude/skills/$$skill; \
		cp -v ./$$skill/SKILL.md ~/.claude/skills/$$skill/SKILL.md; \
		mkdir -p ~/.config/opencode/skills/$$skill; \
		cp -v ./$$skill/SKILL.md ~/.config/opencode/skills/$$skill/SKILL.md; \
		mkdir -p ~/.gemini/extensions/$$skill; \
		cp -v ./$$skill/GEMINI.md ~/.gemini/extensions/$$skill/GEMINI.md; \
		cp -v ./$$skill/gemini-extension.json ~/.gemini/extensions/$$skill/gemini-extension.json; \
	done

.PHONY: help deploy
