
# === info ===

# attribution - by jimmy mg lim ::  www.mirageglobe.com :: github.com/mirageglobe
# reference - https://www.gnu.org/software/make/manual/html_node/Standard-Targets.html

# notes
# - use $$ for escaping variable
# - use - to ignore errors (make)
# - use @ to not print the command

# === targets ===

# menu shortcuts targets
MENU := launchinit

# menu tools targets
MENU := initapps initbrew initcasks initcompletion initenv initfonts initlang initpm initgames inittex maclist macupdate

# menu helpers targets
MENU := now-datetime now-date now-time now-epoch version vinit vpatch vminor vmajor todo help

# load phony
# info - phony is used to make sure there is no similar file(s) such as <target> that cause the make recipe not to work
.PHONY: all clean test $(MENU)

# === variables ===

# set default target
.DEFAULT_GOAL := help

# # set default shell to use
# SHELL := /bin/bash

# sets all lines in the recipe to be passed in a single shell invocation
# ref - https://www.gnu.org/software/make/manual/html_node/One-Shell.html
.ONESHELL:

# === main ===

##@ Menu

launchinit:											## loads basic init tools
	@echo ":: loading basic shell tools ::"
	open https://mail.google.com
	open https://www.reddit.com/
	open https://devhints.io
	open https://www.nerdfonts.com/
	open https://www.noisli.com/

checktools:											## check state of machine
	command -v pip
	command -v python
	command -v ruby
	command -v jq
	# bin - rg fx tree pstree
	# yarn - standard prettier
	# python - 
	@echo ":: listapps :: note that pip (python2 will be deprecated. install as pip3) ::"
	yarn global list
	gem list
	pip list
	pip3 list

inittools:											## ensure that all languages and package managers are in pristine state
	pip3 install --upgrade pip setuptools								# package manager for python
	# tools : frameworks  ============================================================
	pip3 install ansible || pip3 install -U ansible			# cloud ansible
	gem install terraform_landscape											# adding terraform extensions

initcompletion:									## update bash completion scripts
	@echo ":: updating git completion ::"
	curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > dot.bash-completion.git.bash

initenv:												## ensure that environment is setup with folders/files (need run once)
	# works for all os
	@echo ":: ensure environment is pristine ::"
	@echo ":: creating vim folders and setting vimrc ::"
	mkdir -pv ~/.vim/.backup ~/.vim/.swp ~/.vim/.undo
	cp dot.vimrc.template ~/.vimrc
	@echo ":: copying bashrc template ::"
	cp ~/.bashrc ~/.bashrc.bak
	cp dot.mac.bashrc.template ~/.bashrc

initfonts:											## update/install fonts (need run once)
	@echo ":: updating fonts ::"
	-brew cask install \
		font-firacode-nerd-font \
		font-hasklig-nerd-font \
		font-inconsolata-nerd-font \
		font-iosevka-nerd-font \
		font-monoid-nerd-font \
		font-noto-nerd-font \
		font-robotomono-nerd-font \
		font-tinos-nerd-font \

initpm:													## ensure that package managers are setup
	# works for all os
	@echo ":: ensure that package managers are present ::"
	command -v curl
	command -v ruby
	# @echo ":: installing whalebrew ::"
	# command -v whalebrew || curl -L "https://github.com/whalebrew/whalebrew/releases/download/0.1.0/whalebrew-$$(uname -s)-$$(uname -m)" -o /usr/local/bin/whalebrew; chmod +x /usr/local/bin/whalebrew

inittex:												## ensure all latex deps are installed
	@echo ":: installing latex deps ::"
	sudo tlmgr update --self														# update texmaker packager
	sudo tlmgr update --all															# update texmaker packages
	sudo tlmgr install collection-fontsrecommended			# update tex fonts
	sudo tlmgr install lualatex-math
	sudo tlmgr install fontspec													# fontspec used by xelatex and lualatex

macupdate:											## update/check brew/gems/pip (sudo for gem)
	@echo ":: updating mac homebrew/yarn/pip/gem/tlmgr ::"
	yarn global upgrade
	pip install --upgrade pip														# upgrade pip self
	pip install -U $$(pip freeze | awk -F'[/=]' '{print $$1}')
	pip3 install -U $$(pip3 freeze | awk -F'[/=]' '{print $$1}')
	sudo gem update
	sudo tlmgr update --self														# update texmaker packager
	sudo tlmgr update --all															# update texmaker packages
	brew cleanup
	brew cask outdated

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

todo:														## basic todo for this project
	@printf "add python lint security : bandit \n"
	@printf "add ruby lint : use ruby -wc \n"
	@printf "add rails lint : use traceroute \n"
	@printf "add php lint : php -l \n"
	@printf "add php lint : phpstan \n"
	@printf "add php lint : php_codesniffer \n"
	@printf "add php standard lint : php_cs-fixer \n"
	@printf "add php debugger : xdebug \n"

help:														## display this help
	@awk 'BEGIN { FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"; } \
		/^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-30s\033[0m %s\n", $$1, $$2; } \
		/^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5); } \
		END { printf "\n"; }' $(MAKEFILE_LIST)

# Notes :

# $(MAKEFILE_LIST) is an environment variable (name of Makefile) thats available during Make.
# FS = awks field separator. use it in the beginning of execution. i.e. FS = ","
