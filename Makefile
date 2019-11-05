
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
MENU := launchinit checktools inittools initenv initcompletion inittex macupdate

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

# === main

##@ Menu

launchinit:											## loads basic init tools
	@printf ":: loading basic shell tools ::\n"
	open https://mail.google.com
	open https://www.reddit.com/
	open https://devhints.io
	open https://www.nerdfonts.com/
	open https://www.noisli.com/

checktools:											## check state of machine
	@printf ":: check tools ::\n\n"
	-command -V curl | echo "curl not found"
	-command -V jq
	-command -V python
	-command -V pip
	-command -V ruby
	-command -V yarn
	-command -V wget | echo "wget not found"
	-command -V bat | echo "bat not found"
	-command -V rg | echo "rg not found : see https://github.com/BurntSushi/ripgrep/releases/latest"
	# bin - fx tree pstree
	# yarn - standard prettier
	# python - 
	@printf "\n"
	-printf ":: node yarn packages ::\n\n" && yarn global list && printf "\n";
	-printf ":: ruby gem packages ::\n" && gem list && printf "\n";
	-printf ":: python 2 pip packages ::\n\n" && pip list && printf "\n";
	-printf ":: python 3 pip3 packages ::\n\n" && pip3 list && printf "\n";
	-printf ":: color test ::\n\n" && printf "number of colors : " && tput colors && printf "\n";
	-printf ":: summary :: \n\n- note that pip (python2 will be deprecated. install as pip3)\n\n";

inittools:											## ensure that all languages and package managers are in pristine state
	pip3 install --upgrade pip setuptools								# package manager for python
	# tools : frameworks  ============================================================
	pip3 install ansible || pip3 install -U ansible			# cloud ansible
	gem install terraform_landscape											# adding terraform extensions

initupdate:									## update bash completion scripts
	@printf ":: updating completion ::\n"
	curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > dot.bash-completion.git.bash
	@printf ":: fetching fonts ::\n"
	# recommended - brew cask install font-firacode-nerd-font font-hasklig-nerd-font font-inconsolata-nerd-font font-iosevka-nerd-font font-monoid-nerd-font font-noto-nerd-font font-robotomono-nerd-font font-tinos-nerd-font

initenv:												## ensure that environment is setup with folders/files (need run once)
	# works for all os
	@printf ":: ensure environment is pristine ::\n"
	@printf ":: creating vim folders (if not exists) and setting vimrc ::\n"
	mkdir -pv ~/.vim/.backup ~/.vim/.swp ~/.vim/.undo
	# cp dot.vimrc.template ~/.vimrc
	@printf ":: copying bashrc template ::\n"
	# cp ~/.bashrc ~/.bashrc.bak
	# cp dot.mac.bashrc.template ~/.bashrc

inittex:												## ensure all latex deps are installed
	@printf ":: installing latex deps ::\n"
	tlmgr update --self														# update texmaker packager
	tlmgr update --all														# update texmaker packages
	tlmgr install collection-fontsrecommended			# update tex fonts
	tlmgr install lualatex-math
	tlmgr install fontspec												# fontspec used by xelatex and lualatex

macupdate:											## update/check brew/gems/pip (sudo for gem)
	@printf ":: updating mac homebrew/yarn/pip/gem/tlmgr ::\n"
	-yarn global upgrade
	-pip install --upgrade pip										# upgrade pip self
	-pip install -U $$(pip freeze | awk -F'[/=]' '{print $$1}')
	-pip3 install -U $$(pip3 freeze | awk -F'[/=]' '{print $$1}')
	-gem update
	-tlmgr update --self													# update texmaker packager
	-tlmgr update --all														# update texmaker packages

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

