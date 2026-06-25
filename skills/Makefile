# ================================================================ info ===== #
# skills management makefile

# ------------------------------------------------------------ settings ----- #

.DEFAULT_GOAL := help

CYAN  := \033[36m
RESET := \033[0m
BOLD  := \033[1m

SKILLS := ironbeard

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
endef

deploy: ## deploy all skills to Claude and OpenCode global config directories
	$(call print_status,Deploying all skills)
	@for skill in $(SKILLS); do \
		mkdir -p ~/.claude/skills/$$skill; \
		cp -v ./$$skill/SKILL.md ~/.claude/skills/$$skill/SKILL.md; \
		mkdir -p ~/.config/opencode/skills/$$skill; \
		cp -v ./$$skill/SKILL.md ~/.config/opencode/skills/$$skill/SKILL.md; \
	done

clean: ## remove retired skills (architect, caveman, cove, the-beard, davinci, scrooge) from deploy targets
	@for skill in architect caveman cove the-beard davinci scrooge; do \
		rm -rf ~/.claude/skills/$$skill; \
		rm -rf ~/.config/opencode/skills/$$skill; \
	done

deploy-ironbeard: ## deploy ironbeard skill (includes visual mode + token-miser mode)
	$(call deploy_skill,ironbeard)

.PHONY: help deploy clean deploy-ironbeard
