# ===================================================== bash config git ===== #

# --------------------------------------------------------------- setup ----- #

# default config file locations:
#
# - mac/linux         ~/.bashrc
#                     ~/.bash_profile

# touch ~/.bashrc
# include the following in ~/.bashrc file
# assuming the source script is in ~/dot-files

# [ -f "$HOME/dot-files/dot.bashrc.mac.config.bash" ] && source "$HOME/dot-files/dot.bashrc.mac.config.bash"

# -------------------------------------------------------------- config ----- #

printf "%s" "[+] config "

# mac key rate
# for super fast key repeat rate (keyboard)
# echo "defaults write NSGlobalDomain KeyRepeat -int 0"

# ----------------------------------------------------------------- git ----- #

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

# ----------------------------------------------------------------- fzf ----- #

# ensure install fzf via brew
# to support terminal and keybindings, run : /usr/local/opt/fzf/install

# use fd (https://github.com/sharkdp/fd) instead of the default find command for listing path candidates.
# the first argument to the function ($1) is the base path to start traversal

# see the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# - on bash, fuzzy completion is enabled only for a predefined set of commands (complete | grep _fzf to see the list). but you can enable it for other commands as well by using _fzf_setup_completion helper function. for example 'cd' is not in default list

# - add following to bashrc
# _fzf_setup_completion <type path/dir> <commands to hook on>
# _fzf_setup_completion path cat rm ag git kubectl
# _fzf_setup_completion dir cd
