# ================================================ bash common env vars ===== #

# --------------------------------------------------------------- setup ----- #

# touch ~/.bashrc

# example for quick add to ~/.bashrc
# include the following in ~/.bashrc file, assuming the source script is in ~/dot-files

# bash common env, aliases git for mac
# [ -f "$HOME/dot-files/tpl.mac.common.dot.bash" ] && source "$HOME/dot-files/tpl.mac.common.dot.bash"

# ----------------------------------------------------- common env vars ----- #

# show load status
printf "%s" "[+] common "

export CLICOLOR=true
export GREP_OPTIONS='--color=auto'                  # common
export NOW=$(date +"%Y%m%d-000000")                 # common
export EDITOR=vim                                   # common
export TERM=xterm-256color                          # common

# --------------------------------------------------------------- alias ----- #

# alias (type: `alias` to show current aliases)

# show load status
printf "%s" "[+] aliases "

# ------------------------------------------------------------ override ----- #

alias cat='bat'
alias catcat='\cat'
alias ls='lsd'

# ---------------------------------------------------------------- bash ----- #

# bash
alias _cp='cp -i'
alias _mv='mv -i'
alias _rm='rm -i'
alias _rs="printf ':: reload shell :: \n';exec $SHELL -l;"
# alias _ls="ls -Gd .*"
# alias _ll="ls -lhAG"
# alias _tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
# alias _tree_verbose="find . | sed -e 's/[^-][^\/]*\// |/g' -e 's/|\([^ ]\)/|-\1/'"

# -------------------------------------------------------------- custom ----- #

# k8s
alias kc='kubectl config view --minify --output "jsonpath={.current-context}"; echo ""; echo "------------------------"; kubectl cluster-info;'

# lsd
alias ll='lsd -la'
alias lt='lsd --tree'
alias tree='lsd --tree'

# homebrew
alias brewi='arch -x86_64 /usr/local/bin/brew'
alias brewm='arch -arm64e /opt/homebrew/bin/brew'

# postgresql
alias pgstart='pg_ctl -D /usr/local/var/postgresql start'
alias pgstop='pg_ctl -D /usr/local/var/postgresql stop'

# ----------------------------------------------------------------- mac ----- #

printf "%s" "[+] mac "

# mac key rate
# for super fast key repeat rate (keyboard)
# echo "defaults write NSGlobalDomain KeyRepeat -int 0"

# ----------------------------------------------------------------- git ----- #

# custom config for default git settings
# additional settings are defined in .gitconfig template

# show load status
printf "%s" "[+] git "

# default push and pull config
git config --global push.default simple
git config --global push.autoSetupRemote true
git config --global pull.rebase true

# set include gitignore file
git config --global core.excludesfile '~/.gitignore'

# set core editor
git config --global core.editor vim

# set default git user
git config --global user.name 'Jimmy Lim'
git config --global user.email 'mirageglobe@gmail.com'

# set default init branch to main
git config --global init.defaultBranch main

# appending additional git aliases
git config --global alias.alias "config --get-regexp alias"
git config --global alias.a "add --patch"
git config --global alias.b "branch --all --verbose"
git config --global alias.c "commit"
git config --global alias.ca "commit --amend"
git config --global alias.co "checkout"
git config --global alias.cob "checkout -b"
git config --global alias.cobt "checkout -b --track"
git config --global alias.com "checkout main"
git config --global alias.comm "checkout master"
git config --global alias.dm "diff main"
git config --global alias.dh "diff HEAD"
git config --global alias.dhh "diff HEAD^"
git config --global alias.f "fetch"
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global alias.ll "log --pretty='format:%C(yellow)%H%Creset - %Cgreen%>(12)%ad%Creset %C(bold blue)<%an>%Creset %s' --date=relative"
git config --global alias.p "pull"
git config --global alias.pp "push"
git config --global alias.ppp "push --force-with-lease"
git config --global alias.s "status"
git config --global alias.rim "rebase --interactive main"
git config --global alias.rimm "rebase --interactive master"