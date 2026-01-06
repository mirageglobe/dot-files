# ================================================================ info ===== #
# sensible dotfiles and bootstrap using makefile menu script
# by jimmy mg lim ::  www.mirageglobe.com :: github.com/mirageglobe

# ------------------------------------------------------------ settings ----- #

.DEFAULT_GOAL := help

# Colors for output
CYAN := \033[36m
RESET := \033[0m
BOLD := \033[1m

# ------------------------------------------------------------ functions ----- #

define print_status
	@printf "$(CYAN)==> $(1)$(RESET)\n"
endef

define copy_safe
	@if [ -f $(2) ]; then \
		printf "File $(2) exists. Overwrite? [y/N] "; \
		read ans && [ "$$ans" = "y" ] && cp -v $(1) $(2) || printf "Skipping $(2).\n"; \
	else \
		cp -v $(1) $(2); \
	fi
endef

# ================================================================ targets === #

##@ Information

help: ## Display this help menu
	@printf "\n$(BOLD)Usage:$(RESET)\n  make $(CYAN)<target>$(RESET)\n"
	@awk 'BEGIN { FS = ":.*##"; } \
		/^[a-zA-Z0-9_-]+:.*?##/ { printf "  $(CYAN)%-30s$(RESET) %s\n", $$1, $$2; } \
		/^##@/ { printf "\n$(BOLD)%s$(RESET)\n", substr($$0, 5); }' $(MAKEFILE_LIST)

os-info: ## Display OS and network information
	$(call print_status,Getting OS information)
	@uname -a
	@printf "OSTYPE: $$OSTYPE\n"
	@printf "Public IP (v4): "
	@curl -4 -s ifconfig.me || echo "Not available"
	@printf "\nPublic IP (v6): "
	@curl -6 -s ifconfig.me || echo "Not available"
	@printf "\n"

setup-brew: ## Install dependencies from Brewfile
	$(call print_status,Installing dependencies from Brewfile)
	@brew bundle --file=./Brewfile

##@ Setup

setup-all: setup-git setup-vim setup-tmux setup-starship ## Run all primary setups
	$(call print_status,All primary setups complete!)

setup-alacritty: ## Setup Alacritty configuration
	$(call print_status,Setting up Alacritty)
	@mkdir -p ~/.config/alacritty
	$(call copy_safe,./dot.alacritty.yml,~/.config/alacritty/alacritty.yml)

setup-completion: ## Setup Bash completion for Git
	$(call print_status,Setting up Git completions)
	@mkdir -p ~/.bash_completion.d
	@if [ -f ~/.bash_completion.d/git-completion.bash ]; then \
		printf "Git completions already exist. Redownload? [y/N] "; \
		read ans && [ "$$ans" = "y" ] || (printf "Skipping.\n"; exit 0); \
	fi; \
	curl -sSL https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.bash_completion.d/git-completion.bash
	@printf "Done. Ensure 'source ~/.bash_completion.d/git-completion.bash' is in your .bashrc\n"

setup-git: ## Setup global .gitconfig and .gitignore
	$(call print_status,Setting up Git configuration)
	$(call copy_safe,./dot.gitconfig,~/.gitconfig)
	$(call copy_safe,./dot.gitignore,~/.gitignore)

setup-ranger: ## Setup Ranger configuration
	$(call print_status,Setting up Ranger)
	@mkdir -p ~/.config/ranger
	$(call copy_safe,./dot.ranger.conf,~/.config/ranger/rc.conf)

setup-starship: ## Setup Starship prompt
	$(call print_status,Setting up Starship)
	@mkdir -p ~/.config
	$(call copy_safe,./dot.starship.toml,~/.config/starship.toml)

setup-tmux: ## Setup Tmux configuration
	$(call print_status,Setting up Tmux)
	$(call copy_safe,./dot.tmux.conf,~/.tmux.conf)

setup-vim: ## Setup Vim folders and configuration
	$(call print_status,Setting up Vim)
	@mkdir -pv ~/.vim/.backup ~/.vim/.swp ~/.vim/.undo
	$(call copy_safe,./dot.vimrc,~/.vimrc)

##@ Security

scan-trivy: ## Run security scan with trivy (vulnerabilities, secrets, misconfig)
	$(call print_status,Scanning with Trivy)
	-@trivy fs --scanners vuln,secret,misconfig --severity HIGH,CRITICAL --exit-code 0 .

scan-bearer: ## Run security scan with bearer (SAST and secrets)
	$(call print_status,Scanning with Bearer)
	-@bearer scan --scanner secrets,sast --severity high,critical --exit-code 0 .

scan: scan-trivy scan-bearer ## Run all security scans

.PHONY: help os-info setup-all setup-alacritty setup-completion setup-git setup-ranger setup-starship setup-tmux setup-vim scan-trivy scan-bearer scan setup-brew
