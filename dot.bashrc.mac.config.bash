# dotfile config
# [ -f ~/dot-files/dot.bashrc.mac.config.bash ] && source ~/dot-files/dot.bashrc.mac.config.bash

# --------------------------------------------------------------------- git ----

printf "%s" "[+] git "

# default push branch to remote
git config --global push.default current
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
