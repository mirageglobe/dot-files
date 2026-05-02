# ================================================================ info ===== #
# skills management makefile

# ------------------------------------------------------------ settings ----- #

.DEFAULT_GOAL := help

CYAN  := \033[36m
RESET := \033[0m
BOLD  := \033[1m

SKILLS := architect caveman cove davinci ironbeard scrooge the-beard

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

define deploy_skill
	$(call print_status,Deploying skill: $(1))
	@mkdir -p ~/.claude/skills/$(1)
	@cp -v ./$(1)/SKILL.md ~/.claude/skills/$(1)/SKILL.md
	@mkdir -p ~/.config/opencode/skills/$(1)
	@cp -v ./$(1)/SKILL.md ~/.config/opencode/skills/$(1)/SKILL.md
	@mkdir -p ~/.gemini/extensions/$(1)
	@cp -v ./$(1)/GEMINI.md ~/.gemini/extensions/$(1)/GEMINI.md
	@cp -v ./$(1)/gemini-extension.json ~/.gemini/extensions/$(1)/gemini-extension.json
endef

deploy: ## deploy all skills to Claude, OpenCode, and Gemini global config directories
	$(call print_status,Deploying all skills)
	@for skill in $(SKILLS); do \
		mkdir -p ~/.claude/skills/$$skill; \
		cp -v ./$$skill/SKILL.md ~/.claude/skills/$$skill/SKILL.md; \
		mkdir -p ~/.config/opencode/skills/$$skill; \
		cp -v ./$$skill/SKILL.md ~/.config/opencode/skills/$$skill/SKILL.md; \
		mkdir -p ~/.gemini/extensions/$$skill; \
		cp -v ./$$skill/GEMINI.md ~/.gemini/extensions/$$skill/GEMINI.md; \
		cp -v ./$$skill/gemini-extension.json ~/.gemini/extensions/$$skill/gemini-extension.json; \
	done

deploy-architect: ## deploy architect skill
	$(call deploy_skill,architect)

deploy-caveman: ## deploy caveman skill
	$(call deploy_skill,caveman)

deploy-cove: ## deploy cove skill
	$(call deploy_skill,cove)

deploy-davinci: ## deploy davinci skill
	$(call deploy_skill,davinci)

deploy-ironbeard: ## deploy ironbeard skill
	$(call deploy_skill,ironbeard)

deploy-scrooge: ## deploy scrooge skill
	$(call deploy_skill,scrooge)

deploy-the-beard: ## deploy the-beard skill
	$(call deploy_skill,the-beard)

.PHONY: help deploy deploy-architect deploy-caveman deploy-cove deploy-davinci deploy-ironbeard deploy-scrooge deploy-the-beard
