
# === info

# attribution - by jimmy mg lim ::  www.mirageglobe.com :: github.com/mirageglobe
# reference - https://www.gnu.org/software/make/manual/html_node/Standard-Targets.html

# notes
#
# - use $$ for escaping variable
# - use - to ignore errors (make)
# - use @ to not print the command

# === targets

# menu shortcuts targets
MENU := launch check mac-ensure tex-ensure

# menu helpers targets
MENU := now-datetime now-date now-time now-epoch version vinit vpatch vminor vmajor todo help

# load phony
# info - phony is used to make sure there is no similar file(s) such as <target> that cause the make recipe not to work
.PHONY: all clean test $(MENU)

# === variables

# set default target
.DEFAULT_GOAL := help

# # set default shell to use
# SHELL := /bin/bash

# sets all lines in the recipe to be passed in a single shell invocation
# ref - https://www.gnu.org/software/make/manual/html_node/One-Shell.html
.ONESHELL:

# === functions

define fn_check_command_note
	command -V $(1) || printf "$(2)"
endef

define fn_print_header
	printf "\n==> $(1)\n\n";
endef

define fn_print_header_command
	printf "\n==> $(1)\n\n";
	$(2);
endef

# === main

##@ Menu

launch:													## loads basic init tools
	@$(call fn_print_header,launch basic tools)
	open https://mail.google.com
	open https://www.reddit.com/
	open https://devhints.io
	open https://www.nerdfonts.com/
	open https://www.noisli.com/

check:													## check local system / environment
	@$(call fn_print_header,check tools)
	@$(call fn_check_command_note,curl,)
	@$(call fn_check_command_note,jq,)
	@$(call fn_check_command_note,python,)
	@$(call fn_check_command_note,pip,)
	@$(call fn_check_command_note,ruby,)
	@$(call fn_check_command_note,yarn,)
	@$(call fn_check_command_note,wget,)
	@$(call fn_check_command_note,vim,)
	@$(call fn_check_command_note,bat,see https://github.com/sharkdp/bat/releases/latest)
	@$(call fn_check_command_note,rg,see https://github.com/BurntSushi/ripgrep/releases/latest)
	# bin - fx tree pstree
	@$(call fn_print_header_command,brew info,brew list && brew cask list,)
	@$(call fn_print_header_command,node yarn info,yarn global list,)
	@$(call fn_print_header_command,ruby gem info,gem list,)
	@$(call fn_print_header_command,python 2 info,pip list,)
	@$(call fn_print_header_command,python 3 info,pip3 list,)
	@$(call fn_print_header_command,color test,tput colors,)
	@$(call fn_print_header,summary)
	@echo "- note that pip (python2 will be deprecated. install as pip3)";

mac-ensure:											## ensure that folder(s), package managers, tools are present
	# environment : config										==============================
	# @$(call fn_print_header,ensure folders are present)
	# # cp dot.vimrc.template ~/.vimrc
	# # cp ~/.bashrc ~/.bashrc.bak
	# # cp dot.mac.bashrc.template ~/.bashrc
	# tools : common bin											==============================
	@$(call fn_print_header,ensure tool folder exist)
	-mkdir -pv ~/.tools
	@echo "- add export PATH=\"$HOME/.tools:$PATH\""
	# tools : vim															==============================
	@$(call fn_print_header,ensure vim folders exist)
	-mkdir -pv ~/.vim/.backup ~/.vim/.swp ~/.vim/.undo
	# tools : frameworks  ============================================================
	-pip3 install ansible || pip3 install -U ansible		# cloud ansible
	-gem install terraform_landscape										# adding terraform extensions
	# go get -u sigs.k8s.io/kind												# install kind (kubernetes in docker)
	@printf ":: fetching completion to ~/dot.bash-completion.xxx.bash ::\n"
	curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/.tools/dot.bash-completion.git.bash
	@printf ":: fetching fonts to desktop ::\n"
	# recommended - brew cask install font-firacode-nerd-font font-hasklig-nerd-font font-inconsolata-nerd-font font-iosevka-nerd-font font-monoid-nerd-font font-noto-nerd-font font-robotomono-nerd-font font-tinos-nerd-font
	@printf ":: updating mac homebrew/yarn/pip/gem/tlmgr ::\n"
	# tools : node yarn  ============================================================
	# yarn - standard prettier
	-yarn global upgrade
	-yarn global add semver															# dev semver tool for node and other frameworks (try shell only : use https://github.com/fsaintjacques/semver-tool)
	-yarn global add write-good													# lint english grammer
	-yarn global add htmlhint														# lint html
	# yarn global add stylelint														# lint
	-yarn global add standard														# lint javascript (ale)
	# yarn global add eslint															# lint javascript (ale)
	-yarn global add prettier														# lint javascript fixer (ale)
	-yarn global add jsonlint														# lint json
	# -yarn global add vue-language-server									# linter vuejs (ale)
	-yarn global add local-web-server											# server simple local web server - use ws to start
	# yarn global add http-server													# server simple local web server
	# yarn global add fauxton															# db ui - couchdb docker container missing fauxton
	# -yarn global add hotel																# db https://github.com/typicode/hotel
	# -yarn global add json-server													# db https://github.com/typicode/json-server#database
	# https://netflix.github.io/pollyjs/#/
	-yarn global add mountebank													# test mock server
	-yarn global add nightwatch													# test e2e browser test - default by vuejs
	-yarn global add bats																# test shell / bash test suite (bats-core)
	# yarn add --dev cucumber															# test (add for project based) cucumber js
	-yarn global add pomd																# general a pomodoro for breaks exercises
	# npm install -g svg2png-cli
	# npm install -g tty.js
	# tools : python pip  ============================================================
	-pip install --upgrade pip													# upgrade pip self
	-pip3 install --upgrade pip setuptools							# package manager for python
	-pip install -U $$(pip freeze | awk -F'[/=]' '{print $$1}')
	-pip3 install -U $$(pip3 freeze | awk -F'[/=]' '{print $$1}')
	# -pip3 install localstack															# dev stack aws
	# -pip3 install csvkit																# csv editor / converter
	# -pip3 install --upgrade flake8												# lint python (ale)
	# -pip3 install --upgrade autopep8											# lint python based on pep8
	# -pip3 install weasyprint														# doc easy pdf printer https://weasyprint.org/start/
	# tools : ruby gem  ============================================================
	-gem update
	# -gem install mdl																			# linter markdown
	# -gem install cucumber																# test cucumber ruby rails
	@printf ":: summary ::\n"

tex-ensure:											## ensure all latex deps are installed
	@printf ":: ensure tex is present latex deps ::\n"
	tlmgr update --self																	# update texmaker packager
	tlmgr update --all																	# update texmaker packages
	tlmgr install collection-fontsrecommended						# update tex fonts
	tlmgr install lualatex-math
	tlmgr install fontspec															# fontspec used by xelatex and lualatex

##@ Helpers

now-datetime:										## get current date and time
	echo $$(date +"%Y%m%d-%H:%M:%S")

now-date:												## get current date
	echo $$(date +"%Y%m%d")

now-time:												## get current time
	echo $$(date +"%H:%M:%S")

now-epoch:											## get current epoch
	echo $$(date +"%s")

version: ## show current version
	@git describe --tags --abbrev=0

vinit:													## initialise first version
	@git tag 0.1.0

vpatch:													## show bumped version + patch (fix) - use : git tag $(make vpatch)
	@semver $$(git describe --tags --abbrev=0) -i patch

vminor:													## show bumped version + minor (non breaking) - use : git tag $(make vminor)
	@semver $$(git describe --tags --abbrev=0) -i minor

vmajor:													## show bumped version + major (breaking) - git tag $(make vmajor)
	@semver $$(git describe --tags --abbrev=0) -i major

help:														## display this help
	@awk 'BEGIN { FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"; } \
		/^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-30s\033[0m %s\n", $$1, $$2; } \
		/^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5); } \
		END { printf "\n"; }' $(MAKEFILE_LIST)

# === notes

# $(MAKEFILE_LIST) is an environment variable (name of Makefile) thats available during Make.
# FS = awks field separator. use it in the beginning of execution. i.e. FS = ","

