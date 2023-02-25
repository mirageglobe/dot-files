
# ================================================================ info ===== #

# ----------------------------------------------------------- reference ----- #

# sensible dotfiles and bootstrap using makefile menu script
# by jimmy mg lim ::  www.mirageglobe.com :: github.com/mirageglobe

# ------------------------------------------------------------ settings ----- #

# defaults
MENU := all clean test

# helpers
MENU += help readme

# main
MENU += setup-alacritty setup-git setup-tmux setup-vim

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
	# ---------------------------------------------------- $(1) ----- #
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

setup-alacritty:								## setup alacritty config
	$(call func_print_arrow,setup alacritty - skip)
	-mkdir -pv ~/.config/alacritty/
	-cp -i dot.alacritty.yml ~/.config/alacritty/alacritty.yml				# set alacritty config from template

setup-git:											## setup gitconfig and gitignore
	$(call func_print_arrow,setup git - config)
	-touch ~/.gitignore
	-touch ~/.gitconfig
	$(call func_print_arrow,setup git - overwrite home .gitconfig and .gitignore)
	-cp -i dot.gitconfig ~/.gitconfig
	-cp -i dot.gitignore ~/.gitignore

setup-tmux:											## setup tmux config
	$(call func_print_arrow,setup tmux - config)
	$(call func_print_arrow,setup tmux - overwrite home .tmux.conf)
	-cp -i dot.tmux.conf ~/.tmux.conf

setup-vim:											## setup vim folders
	$(call func_print_arrow,setup vim - ensure vimrc and vim backup swap undo folders exist)
	-mkdir -pv ~/.vim/.backup ~/.vim/.swp ~/.vim/.undo
