
# === info

# sensible dotfiles and bootstrap script
# attribution - by jimmy mg lim ::  www.mirageglobe.com :: github.com/mirageglobe

# === targets
MENU := all clean test

# menu helpers
MENU += ensure-common ensure-gem ensure-pip ensure-yarn
MENU += help info

# menu targets
MENU += status ensure-mac ensure-deb ensure-tools

# load phony (fake targets so make does not interpret commands as files)
.PHONY: $(MENU)

# === variables

# set default target
.DEFAULT_GOAL := help

# # set default shell to use
SHELL := /bin/bash

# sets all lines in the recipe to be passed in a single shell invocation. or use multi-line (not posix)
.ONESHELL:

# === functions

define fn_check_file_regex
	cat $(1) || grep "$(2)"
endef

define fn_check_command_note
	command -V $(1) || printf "$(2)"
endef

define fn_print_header
	echo "";
	echo "==> $(1)";
	echo "";
endef

define fn_print_header_command
	echo "";
	echo "==> $(1)";
	echo "";
	$(2);
endef

# === main

##@ Helpers

help:														## display this help
	@awk 'BEGIN { FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"; } \
		/^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-30s\033[0m %s\n", $$1, $$2; } \
		/^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5); } \
		END { printf ""; }' $(MAKEFILE_LIST)

ensure-common:
	# === tools : vim							========================================
	@$(call fn_print_header,ensure common)
	@echo "ensure vimrc and vim backup, swap, undo folders exist ..";
	-mkdir -pv ~/.vim/.backup ~/.vim/.swp ~/.vim/.undo
	# === tools : git							========================================
	-touch ~/.gitignore
	-touch ~/.gitconfig

ensure-gem:
	# to install, always use : gem install <package> --user
	-gem update --system || echo "never use sudo for gem installation; check ruby path in homebrew or use chruby"
	-gem update || echo "never use sudo for gem installation; check ruby path in homebrew or use chruby"
	# === archived								========================================
	# -gem install --user-install mdl										# linter markdown
	# -gem install --user-install terraform_landscape		# adding terraform extensions
	# -gem install --user-install cucumber							# test cucumber ruby rails

ensure-pip:
	# -pip3 install --upgrade pip setuptools						# package manager for python upgrade pip causes issues with brew python (reinstall python instead)
	-pip3 install -U $$(pip3 freeze | awk -F'[/=]' '{print $$1}')
	-pip3 install ansible || pip3 install -U ansible									# configuration
	-pip3 install ansible-lint || pip3 install -U ansible-lint				# linter ansible
	-pip3 install sslyze || pip3 install -U sslyze										# ssl check
	-pip3 install paramiko || pip3 install -U paramiko								# ssh
	# === archived								========================================
	# -pip3 install csvkit															# csv editor / converter
	# -pip3 install localstack													# dev stack aws
	# -pip3 install --upgrade flake8										# lint python (ale)
	# -pip3 install --upgrade autopep8									# lint python based on pep8
	# -pip3 install weasyprint													# doc easy pdf printer https://weasyprint.org/start/

ensure-yarn:
	-yarn global upgrade
	-yarn global add electron													# framework desktop
	-yarn global add fx																# json parser
	-yarn global add htmlhint													# linter html
	-yarn global add moby															# thesaurus
	-yarn global add prettier													# linter javascript fixer (ale)
	-yarn global add standard													# linter javascript (ale)
	-yarn global add write-good												# linter english grammer
	# === archived								========================================
	# -yarn global add bats															# test bash (bats-core)
	# -yarn global upgrade --latest bats
	# -yarn global add @babel/core @babel/cli						# framework - vue-global-service dependency
	# -yarn global add cordova													# framework - cross mobile
	# -yarn global add eslint														# linter javascript (ale)
	# -yarn global add fauxton													# database - couchdb ui docker container missing fauxton
	# -yarn global add graphql													# framework - vue graphql dependency
	# -yarn global add http-server											# server simple web server
	# -yarn global add hotel														# database https://github.com/typicode/hotel
	# -yarn global add jsonlint													# linter json
	# -yarn global add json-server											# database https://github.com/typicode/json-server#database
	# -yarn global add local-web-server									# server - use ws to start
	# -yarn global add mountebank												# test mock server
	# -yarn global add @neutralinojs/neu								# framework nwjs and electron alternative (deprecated)
	# -yarn global add nightwatch												# test e2e browser - default by vuejs
	# -yarn global add pomd															# pomodoro
	# -yarn global add semver														# semver (see https://github.com/fsaintjacques/semver-tool)
	# -yarn global add stylelint												# linter
	# -yarn global add typescript												# framework
	# -yarn global add serverless												# framework
	# -yarn global add svg2png-cli											# converter
	# -yarn global add tty.js
	# -yarn global add @vue/cli													# framework web vue-cli 3.x
	# -yarn global upgrade --latest @vue/cli
	# -yarn global add @vue/cli-service-global					# framework - vue service global
	# -yarn global add vue-language-server							# linter vuejs (ale)

##@ Menu

status:																								## check system / environment status
	@$(call fn_print_header,status)
	# === check package managers	========================================
	@echo "check if languages and package managers exist ..";
	@echo "proceed? [enter to continue / ctrl-c to quit]"; read nirvana;
	@(command -v gem || echo gem not found. install ruby.)
	@(command -v python || echo python not found. install python3.)
	@(command -v pip3 || echo pip3 not found. install python3.)
	# === check status					========================================
	@echo "check if recommended tools exist ..";
	@echo "proceed? [enter to continue / ctrl-c to quit]"; read nirvana;
	@$(call fn_check_command_note,bat,see https://github.com/sharkdp/bat)
	@$(call fn_check_command_note,curl,)
	@$(call fn_check_command_note,fd,see https://github.com/sharkdp/fd)
	@$(call fn_check_command_note,fx,)
	@$(call fn_check_command_note,fzf,)
	@$(call fn_check_command_note,jq,)
	@$(call fn_check_command_note,rg,see https://github.com/BurntSushi/ripgrep/releases/latest)
	@$(call fn_check_command_note,vim,)
	@$(call fn_check_command_note,wget,)
	@$(call fn_check_command_note,yq,)
	@$(call fn_print_header_command,brew info,brew list && brew list --cask)
	@$(call fn_print_header_command,node yarn info,yarn global list)
	@$(call fn_print_header_command,ruby gem info,gem list)
	@$(call fn_print_header_command,python3 info,pip3 list)
	@$(call fn_print_header_command,color test,tput colors)

ensure-deb: ensure-common														## ensure debian specific cli tools and dependencies present
	@$(call fn_print_header,ensure tools exist)
	# curl https://sh.rustup.rs -sSf | sh								# recommended rust installation method (official book)
	@(command -v cargo || echo rust and cargo not found. install rust.) && command -v cargo
	@command -v cargo &>/dev/null || { echo "cargo/rust not installed. try brew install xxxx [abort]" >&2; exit 1; }
	cargo install lsd

ensure-mac: ensure-common														## ensure mac specific cli tools and dependencies present
	# @$(call fn_print_header,ensure .config/alacritty/alacritty.yml exist)
	# -mkdir -pv ~/.config/alacritty/
	# -cp -i dot.alacritty.yml ~/.config/alacritty/alacritty.yml				# set alacritty config from template
	# === setup git config
	-cp -i dot.gitconfig ~/.gitconfig
	-cp -i dot.gitignore ~/.gitignore
	# === setup starship config
	-cp -i starship.toml ~/.config/starship.toml
	# === setup tmux config
	-cp -i dot.tmux.conf ~/.tmux.conf

ensure-tools:																				## ensure yarn pip gem cli tools present
	# === tools : install n (nodejs)		========================================
	-command -v n || curl -L https://git.io/n-install | bash
	-n latest
	# === tools : install yarn (nodejs)	========================================
	-command -v yarn || curl -o- -L https://yarnpkg.com/install.sh | bash
