
################################################################################
# ===================================================================== info = #
################################################################################

# --------------------------------------------------------------- references ---

# sensible dotfiles and bootstrap using makefile menu script
# by jimmy mg lim ::  www.mirageglobe.com :: github.com/mirageglobe


################################################################################
# ============================================================ configuration = #
################################################################################

# ------------------------------------------------------------------ targets ---
# defaults
MENU := all clean test

# helpers
MENU += help readme
MENU += ensure-common

# main
MENU += list-tools status ensure-mac ensure-deb ensure-ark ensure-gem ensure-pip ensure-tex ensure-yarn

# load phony
.PHONY: $(MENU)

# ----------------------------------------------------------------- settings ---

# set default target
.DEFAULT_GOAL := help

# ---------------------------------------------------- environment variables ---

# load dot.env file into environment (prepend hypen to skip if not found)
# -include dot.env

# load current shell env vars into makefile shell env
export

################################################################################
# ======================================================= makefile functions = #
################################################################################

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

################################################################################
# ===================================================================== main = #
################################################################################

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

ensure-common:
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

##@ Menu

list-tools:											## list common cli tools how-to install
	$(call func_print_header,list tool setup)
	# arkade : <https://github.com/alexellis/arkade>
	# curl -sLS https://get.arkade.dev | sudo sh
	#
	# fzf enable fuzzy completion, run following
	# /usr/local/opt/fzf/install
	#
	# n node package manager
	# <https://github.com/tj/n>
	# -command -v n || curl -L https://git.io/n-install | bash
	# -n latest
	#
	# sdkman - java gradle
	# <https://github.com/sdkman/sdkman-cli>
	# curl -s https://get.sdkman.io | bash
	#
	# yarn
	# <https://yarnpkg.com/getting-started/install>
	# corepack enable
	#
	# whalebrew
	# whalebrew install tsub/graph-easy

status:														## check system / environment status
	$(call func_print_header,status)
	$(call func_print_arrow,check package managers)
	@echo "check if languages and package managers exist ..";
	@echo "proceed? [enter to continue / ctrl-c to quit]"; read nirvana;
	@(command -v gem || echo gem not found. install ruby.)
	@(command -v python || echo python not found. install python3.)
	@(command -v pip3 || echo pip3 not found. install python3.)
	$(call func_print_arrow,check status)
	@echo "check if recommended tools exist ..";
	@echo "proceed? [enter to continue / ctrl-c to quit]"; read nirvana;
	$(call func_check_command,bat,see https://github.com/sharkdp/bat)
	$(call func_check_command,curl,)
	$(call func_check_command,fd,see https://github.com/sharkdp/fd)
	$(call func_check_command,fx,)
	$(call func_check_command,fzf,)
	$(call func_check_command,jq,)
	$(call func_check_command,rg,see https://github.com/BurntSushi/ripgrep/releases/latest)
	$(call func_check_command,vim,)
	$(call func_check_command,wget,)
	$(call func_check_command,yq,)
	$(call func_print_arrow,show brew packages)
	-brew list && brew list --cask
	$(call func_print_arrow,show node npm yarn packages)
	-yarn global list
	$(call func_print_arrow,show ruby gem packages)
	-gem list
	$(call func_print_arrow,show python pip packages)
	-pip3 list
	$(call func_print_arrow,show supported colors)
	-tput colors

ensure-deb: ensure-common				## ensure debian specific cli tools and dependencies present
	$(call func_print_header,ensure debian)
	$(call func_print_arrow,check rust cargo packages)
	@(command -v cargo || echo rust and cargo not found. try brew install rust.) && command -v cargo
	# --------------------------------------------------------------- archive --- #
	$(call func_print_arrow,install rust)
	# curl https://sh.rustup.rs -sSf | sh									# recommended rust installation method (official book)
	$(call func_print_arrow,install rust packages)
	# cargo install lsd																		# install lsd

ensure-mac: ensure-common				## ensure mac specific cli tools and dependencies present
	$(call func_print_header,ensure mac)
	# === setup starship config
	$(call func_print_arrow,setup starship - prompt config)
	-cp -i starship.toml ~/.config/starship.toml

ensure-ark:											## install tools with arkade
	@echo "this will try to install apps from arkade :"
	@echo "<https://github.com/alexellis/arkade>"
	@echo "proceed? [enter to continue / ctrl-c to quit]"; read nirvana;
	$(call func_print_header,ensure arkade ark)
	ark get helm
	ark get k9s
	ark get kubectl
	ark get kubectx
	ark get kubens
	ark get yq

ensure-gem: 										## install gem global tools
	$(call func_print_header,ensure ruby gem)
	$(call func_print_arrow,check gem)
	gem --version
	# to install, always use : gem install <package> --user
	$(call func_print_arrow,update gem packages)
	@echo "proceed? [enter to continue / ctrl-c to quit]"; read nirvana;
	-gem update --system || echo "never use sudo for gem installation; check ruby path in homebrew or use chruby"
	-gem update || echo "never use sudo for gem installation; check ruby path in homebrew or use chruby"
	# --------------------------------------------------------------- archive --- #
	# -gem install --user-install mdl											# linter markdown
	# -gem install --user-install terraform_landscape			# adding terraform extensions
	# -gem install --user-install cucumber								# test cucumber ruby rails

ensure-pip:											## install pip global tools
	$(call func_print_header,ensure python pip)
	$(call func_print_arrow,check pip)
	$(call func_check_command,pyenv,run: brew install pyenv)
	pyenv --version
	pyenv versions
	# pyenv install --list  # show all installable versions
	# pyenv install 3.10.1  # install version
	pyenv local 3.10.1
	pip --version
	pip check
	$(call func_print_arrow,upgrade pip self)
	pip install --upgrade pip
	@echo "proceed? [enter to continue / ctrl-c to quit]"; read nirvana;
	# -pip install --upgrade pip setuptools						# package manager for python upgrade pip causes issues with brew python (reinstall python instead)
	$(call func_print_arrow,upgrade pip packages)
	@echo "proceed? [enter to continue / ctrl-c to quit]"; read nirvana;
	-pip install -U $$(pip freeze | awk -F'[/=]' '{print $$1}')				# update all
	-pip install ansible || pip3 install -U ansible										# configuration
	-pip install paramiko || pip3 install -U paramiko									# ssh
	# --------------------------------------------------------------- archive --- #
	# -pip3 install ansible-lint || pip3 install -U ansible-lint				# linter ansible
	# -pip3 install sslyze || pip3 install -U sslyze										# ssl check
	# -pip3 install csvkit																# csv editor / converter
	# -pip3 install localstack														# dev stack aws
	# -pip3 install --upgrade flake8											# lint python (ale)
	# -pip3 install --upgrade autopep8										# lint python based on pep8
	# -pip3 install weasyprint														# doc easy pdf printer https://weasyprint.org/start/

ensure-tex:											## setup basictex with tlmgr package manager
	$(call func_print_header,ensure basictex latex tex tlmgr)
	sudo tlmgr update --self														# update texmaker packager
	sudo tlmgr update --all															# update texmaker packages
	sudo tlmgr install collection-fontsrecommended			# update tex fonts
	sudo tlmgr install lualatex-math										# required lualatex
	sudo tlmgr install fontspec													# required xelatex and lualatex
	sudo tlmgr install extsizes													# extend sizes https://www.ctan.org/pkg/extsizes
	sudo tlmgr install grffile													# required lualatex
	sudo tlmgr install selnolig													# required cv

ensure-yarn:										## install yarn global tools
	$(call func_print_header,ensure node npm yarn)
	$(call func_print_arrow,check yarn)
	$(call func_check_command,yarn,run : make list-tools)
	yarn --version
	$(call func_print_arrow,upgrade node yarn packages)
	-yarn global upgrade															# upgrade all
	-yarn global add cordova													# framework - cross mobile
	-yarn global add electron													# framework desktop
	-yarn global add fx																# json parser
	-yarn global add htmlhint													# linter html
	-yarn global add moby															# thesaurus
	-yarn global add prettier													# linter javascript fixer (ale)
	-yarn global add standard													# linter javascript (ale)
	-yarn global add write-good												# linter english grammer
	-yarn global add @vue/cli													# framework web vue-cli 3.x
	# --------------------------------------------------------------- archive --- #
	# -yarn global add bats															# test bash (bats-core)
	# -yarn global upgrade --latest bats
	# -yarn global add @babel/core @babel/cli						# framework - vue-global-service dependency
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
	# -yarn global upgrade --latest @vue/cli
	# -yarn global add @vue/cli-service-global					# framework - vue service global
	# -yarn global add vue-language-server							# linter vuejs (ale)
