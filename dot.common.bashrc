# === common bashrc

printf "%s\t" ":: common : "

# === common env variables

printf "%s" "[+] envvars "

export GREP_OPTIONS='--color=auto'                    # common
export NOW=$(date +"%Y%m%d-000000")                   # common
export EDITOR=vim                                     # common
export TERM=xterm-256color                            # common

# === apps and tools required settings

# === === android sdk settings
# printf "%s" "[+] android "
# export ANDROID_HOME=/usr/local/opt/android-sdk

# === === autojump settings
# https://github.com/wting/autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# === === fzf settings
# note that fzf will try to install this to default .bashrc too
# [ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_COMPLETION_TRIGGER='??'

# === === jenv settings (http://www.jenv.be/)
# export PATH="$HOME/.jenv/bin:$PATH"
# eval "$(jenv init -)"

# === === java adopt settings
printf "%s" "[+] java "
if [ -z $JAVA_HOME ]; then
  export JAVA_HOME=$(/usr/libexec/java_home)
fi

# === === n settings (node and yarn package mgr) default install to home folder
# export N_PREFIX=$HOME/n
# export PREFIX=$HOME/n

# === === python3 settings
printf "%s" "[+] python "
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# === === ruby3 settings (homebrew)
printf "%s" "[+] ruby "

export PATH="/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"

# $HOME/.gem folder created by gem install <package> --user
export PATH="$HOME/.gem/ruby/3.0.0/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"

# === git

printf "%s" "[+] git "

# === === git config and settings
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

# === bash completions

printf "%s" "[+] completion "

# === === checks if bash version is 5
BASH_VERSION_5=false

if echo ${BASH_VERSION} | grep -q "^5\."; then
  BASH_VERSION_5=true
fi

if ${BASH_VERSION_5} = true; then
  printf "%s" "bash(v5+) "
else
  printf "%s" "bash(v?) "
fi

if ${BASH_VERSION_5} = true; then
  export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
  [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
fi

# === === git completion
# # this should be added automatically if bash-completion@2 is installed
# if [ -f ~/dot.bash-completion.git.bash ]; then
#   source ~/dot.bash-completion.git.bash
# fi

# === === kubectl completion
if command -V kubectl 1> /dev/null; then
  source <(kubectl completion bash)
fi

# === === make completion
# if [ -f ~/dot.bash-completion.make.bash ]; then
#   source ~/dot.bash-completion.make.bash
# fi

# === aliases (type: "$ alias" to show current aliases)

printf "%s" "[+] aliases "

# === === overrides

alias cat="bat"
alias kc="kubectl config view --minify --output 'jsonpath={.current-context}'; echo ''; echo '------------------------'; kubectl cluster-info;"

alias ls="lsd"
alias ll="lsd -la"
alias lt="lsd --tree"
alias tree="lsd --tree"

# === === new commands

# alias _ls="ls -Gd .*"
# alias _ll="ls -lhAG"
# alias _tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
# alias _tree_verbose="find . | sed -e 's/[^-][^\/]*\// |/g' -e 's/|\([^ ]\)/|-\1/'"

alias _cp="cp -i"
alias _mv="mv -i"
alias _rm="rm -i"

alias _rs="printf ':: reload shell :: \n';exec $SHELL -l;"

alias ibrew='arch -x86_64 /usr/local/bin/brew'
alias mbrew='arch -arm64e /opt/homebrew/bin/brew'

# === bash loader end

# printf "%s\\n" "::"
# cat <<-EOF
# :: term size $(stty size) :: type 'alias' - to show aliases
# EOF
# do not indent, nor add anything after closing EOF
