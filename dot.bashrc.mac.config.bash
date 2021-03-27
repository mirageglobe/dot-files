# dotfile config
## [ -f ~/dot-files/dot.bashrc.mac.config.bash ] && source ~/dot-files/dot.bashrc.mac.config.bash

printf "%s" "[+] git "

# default push branch to remote
git config --global push.default current
git config --global pull.rebase true

# set include gitignore file
git config --global core.excludesfile '~/.gitignore'

# set core editor
git config --global core.editor vim

# appending additional git aliases
git config --global alias.alias "config --get-regexp alias"
git config --global alias.a "add -p"
git config --global alias.b "branch -a"
git config --global alias.c "commit"
git config --global alias.ca "commit --amend"
git config --global alias.co "checkout"
git config --global alias.cob "checkout -b"
git config --global alias.com "checkout main"
git config --global alias.comm "checkout master"
git config --global alias.f "fetch"
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global alias.lgg "log --pretty='format:%C(yellow)%H%Creset - %Cgreen%>(12)%ad%Creset %C(bold blue)<%an>%Creset %s' --date=relative"
git config --global alias.p "pull"
git config --global alias.pp "push"
git config --global alias.ppp "push -f"
git config --global alias.s "status"
git config --global alias.rim "rebase -i main"
git config --global alias.rimm "rebase -i master"
