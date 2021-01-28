
# === info

# attribution - by jimmy mg lim ::  www.mirageglobe.com :: github.com/mirageglobe

# === targets

# menu targets
MENU := launch check ensure-mac ensure-deb ensure-tools scan-he

# menu helpers
MENU := ensure-mac-init ensure-deb-init ensure-common
MENU := help

# load phony
# info - phony is used to make sure there is no similar file(s) such as <target> that cause the make recipe not to work
.PHONY: all clean test $(MENU)

# === variables

# set default target
.DEFAULT_GOAL := help

# # set default shell to use
# SHELL := /bin/bash

# sets all lines in the recipe to be passed in a single shell invocation. or use multiline
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
		END { printf "\n"; }' $(MAKEFILE_LIST)

ensure-mac-init:
	@$(call fn_print_header,ensure .config/alacritty/alacritty.yml exist)
	-cp -i dot.mac.alacritty.yml ~/.config/alacritty/alacritty.yml
	@$(call fn_print_header,ensure .tmux exist)
	-cp -i dot.tmux.conf ~/.tmux.conf																	# always overwrite

ensure-deb-init:
	@$(call fn_print_header,ensure tools exist)
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	@(command -v cargo || echo rust and cargo not found. install rust.) && command -v cargo
	@command -v cargo &>/dev/null || { echo "cargo/rust not installed. try brew install xxxx [abort]" >&2; exit 1; }
	cargo install lsd

ensure-common:
	# === environment : config									========================================
	@$(call fn_print_header,ensure .bashrc exist)
	-cp -n tpl.bashrc ~/.bashrc || echo "skip - found .bashrc"				# never overwrite
	# === tools : vim													========================================
	@$(call fn_print_header,ensure .vimrc and folders exist)
	-cp -i tpl.vimrc ~/.vimrc																					# always overwrite
	-mkdir -pv ~/.vim/.backup ~/.vim/.swp ~/.vim/.undo

##@ Menu

launch:													## launch useful web tools
	@$(call fn_print_header,launch basic tools)
	open https://mail.google.com/
	open https://www.reddit.com/
	open https://devhints.io/
	open https://programming-idioms.org/
	open https://www.nerdfonts.com/
	open https://www.noisli.com/

check:													## check system / environment
	@$(call fn_print_header,check tools)
	@$(call fn_check_command_note,bat,see https://github.com/sharkdp/bat)
	@$(call fn_check_command_note,curl,)
	@$(call fn_check_command_note,fd,see https://github.com/sharkdp/fd)
	@$(call fn_check_command_note,fx,)
	@$(call fn_check_command_note,fzf,)
	@$(call fn_check_command_note,jq,)
	@$(call fn_check_command_note,pip,)
	@$(call fn_check_command_note,python,)
	@$(call fn_check_command_note,rg,see https://github.com/BurntSushi/ripgrep/releases/latest)
	@$(call fn_check_command_note,ruby,)
	@$(call fn_check_command_note,wget,)
	@$(call fn_check_command_note,yarn,)
	@$(call fn_check_command_note,vim,)
	@$(call fn_print_header_command,brew info,brew list && brew list --cask)
	@$(call fn_print_header_command,node yarn info,yarn global list)
	@$(call fn_print_header_command,ruby gem info,gem list)
	@$(call fn_print_header_command,python3 info,pip3 list)
	@$(call fn_print_header_command,color test,tput colors)

scan-he:												## run hawkeye scanner
	docker run --rm -v $$PWD:/target hawkeyesec/scanner-cli

ensure-mac: ensure-common	ensure-mac-init							## ensure mac gui tools and common-ensure present
	# === notes
	# https://shift.infinite.red/npm-vs-yarn-cheat-sheet-8755b092e5cc
	#
	# run make ensure-tools

ensure-deb: ensure-common ensure-deb-init							## ensure debian gui tools and common-ensure present
	#
	# run make ensure-tools

ensure-tools:										## ensure package managers and non gui tools present
	@$(call fn_print_header,note)
	# === check status									========================================
	@echo checking python pip ruby gems yarn are recommended tools
	@(command -v gem || echo gem not found. install ruby.) && command -v gem
	@(command -v n || echo n not found. install n.) && command -v n
	@(command -v python || echo python not found. install python3.) && command -v python
	@(command -v pip3 || echo pip3 not found. install python3.) && command -v pip3
	@(command -v yarn || echo yarn not found. install yarn.) && command -v yarn
	-command -v n || curl -L https://git.io/n-install | bash
	-n latest
	-command -v yarn || curl -o- -L https://yarnpkg.com/install.sh | bash
	# === tools : node yarn							========================================
	@$(call fn_print_header,ensure node yarn bins are pristine)
	-yarn global upgrade
	-yarn global add write-good												# lint english grammer
	-yarn global add htmlhint													# lint html
	-yarn global add standard													# lint javascript (ale)
	-yarn global add prettier													# lint javascript fixer (ale)
	-yarn global add jsonlint													# lint json
	-yarn global add fx																# json tool
	-yarn global add electron													# desktop webkit
	-yarn global add @vue/cli													# web framework - vue cli 3.x
	-yarn global upgrade --latest @vue/cli
	-yarn global add local-web-server									# server simple local web server - use ws to start
	-yarn global add bats															# test bash test suite (bats-core)
	-yarn global upgrade --latest bats
	-yarn global add mountebank												# test mock server
	-yarn global add nightwatch												# test e2e browser test - default by vuejs
	# === tools : python pip						========================================
	# -pip3 install --upgrade pip setuptools														# package manager for python upgrade pip causes issues with brew python (reinstall python instead)
	-pip3 install -U $$(pip3 freeze | awk -F'[/=]' '{print $$1}')
	-pip3 install ansible || pip3 install -U ansible									# ansible
	-pip3 install ansible-lint || pip3 install -U ansible-lint				# lint ansible
	-pip3 install sslyze || pip3 install -U sslyze										# ssl check tool
	-pip3 install paramiko || pip3 install -U paramiko								# ssh tool
	# === tools : ruby gems							========================================
	@$(call fn_print_header,ensure ruby system gems are pristine)
	# to install, always use : gem install <package> --user
	-gem update --system || echo "never use sudo for gem installation; check ruby path in homebrew"
	-gem update || echo "never use sudo for gem installation; check ruby path in homebrew"
	@$(call fn_print_header,ensure ruby user dir gems are pristine)
	# === archived tools								========================================
	# -yarn global add semver														# dev semver tool (see https://github.com/fsaintjacques/semver-tool)
	# -yarn global add stylelint													# lint
	# -yarn global add eslint														# lint javascript (ale)
	# -yarn global add vue-language-server							# linter vuejs (ale)
	# -yarn global add typescript												# javascript framework
	# -yarn global add graphql														# web framework - vue graphql dependency
	# -yarn global add @vue/cli-service-global						# web framework - vue service global
	# -yarn global add @babel/core @babel/cli						# web framework - vue-global-service dependency
	# -yarn global add cordova														# mobile framework - cross mobile
	# -yarn global add serverless												# serverless framework
	# -yarn global add @neutralinojs/neu								# nwjs and electron alternative (deprecated)
	# -yarn global add http-server												# server simple local web server
	# -yarn global add fauxton														# db ui - couchdb docker container missing fauxton
	# -yarn global add hotel														# db https://github.com/typicode/hotel
	# -yarn global add json-server											# db https://github.com/typicode/json-server#database
	# -yarn global add pomd															# general pomodoro
	# -yarn global add svg2png-cli
	# -yarn global add tty.js
	# -yarn add cucumber --dev														# test (per project) cucumber
	# -yarn add @babel/core @babel/cli --dev							# (project) babel version backport
	# -pip3 install localstack													# dev stack aws
	# -pip3 install csvkit															# csv editor / converter
	# -pip3 install --upgrade flake8										# lint python (ale)
	# -pip3 install --upgrade autopep8									# lint python based on pep8
	# -pip3 install weasyprint													# doc easy pdf printer https://weasyprint.org/start/
	# -gem install --user-install mdl											# lint markdown
	# -gem install --user-install terraform_landscape			# adding terraform extensions
	# -gem install --user-install cucumber								# test cucumber ruby rails
