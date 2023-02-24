
# ================================================================ info ===== #

# ----------------------------------------------------------- reference ----- #

# sensible dotfiles and bootstrap using makefile menu script
# by jimmy mg lim ::  www.mirageglobe.com :: github.com/mirageglobe

# ============================================================== config ===== #

# ------------------------------------------------------------ settings ----- #

# defaults
MENU := all clean test

# helpers
MENU += help readme

# main
MENU += setup-config

# load phony
.PHONY: $(MENU)

# set default target
.DEFAULT_GOAL := help

# ----------------------------------------------- environment variables ----- #

# load dot.env file into environment (prepend hypen to skip if not found)
# -include dot.env

# load current shell env vars into makefile shell env
export

# =========================================================== functions ===== #

# note that define can only take single line or rule

define func_print_arrow
	# ==> $(1)
endef

define func_print_header
	# ============================================= ### $(1) ###
endef

define func_check_command
	command -V $(1) || printf "$(2)"
endef

# ================================================================ main ===== #

##@ Helpers

help:														## display this help
	@awk 'BEGIN { FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"; } \
		/^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-30s\033[0m %s\n", $$1, $$2; } \
		/^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5); } \
		END { printf ""; }' $(MAKEFILE_LIST)

readme:													## show information and notes
	$(call func_print_header,show readme)
	@touch README.md
	@cat README.md

##@ Menu

setup-config:										## setup config files and folders (vim, alacritty, gitconfig, gitignore, tmux)
	$(call func_print_header,ensure common)
	$(call func_print_arrow,setup vim - ensure vimrc and vim backup swap undo folders exist)
	-mkdir -pv ~/.vim/.backup ~/.vim/.swp ~/.vim/.undo
	$(call func_print_arrow,setup alacritty - skip)
	# -mkdir -pv ~/.config/alacritty/
	# -cp -i dot.alacritty.yml ~/.config/alacritty/alacritty.yml				# set alacritty config from template
	$(call func_print_arrow,setup git - config)
	-touch ~/.gitignore
	-touch ~/.gitconfig
	$(call func_print_arrow,setup git - overwrite home .gitconfig and .gitignore)
	-cp -i dot.gitconfig ~/.gitconfig
	-cp -i dot.gitignore ~/.gitignore
	# $(call func_print_arrow,setup tmux - config)
	# $(call func_print_arrow,setup tmux - overwrite home .tmux.conf)
	# -cp -i dot.tmux.conf ~/.tmux.conf
