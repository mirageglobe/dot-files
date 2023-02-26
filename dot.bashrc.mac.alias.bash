# =================================================== bash config alias ===== #

# --------------------------------------------------------------- setup ----- #

# default config file locations:
#
# - mac/linux         ~/.bashrc
#                     ~/.bash_profile

# touch ~/.bashrc
# include the following in ~/.bashrc file
# assuming the source script is in ~/dot-files

# [ -f "$HOME/dot-files/dot.bash.mac.alias.bashrc" ] && source "$HOME/dot-files/dot.bash.mac.alias.bashrc"

# -------------------------------------------------------------- config ----- #

# alias (type: `alias` to show current aliases)

printf "%s" "[+] aliases "

# ------------------------------------------------------------ override ----- #

alias cat='bat'
alias catcat='\cat'
alias ls='lsd'

# -------------------------------------------------------------- custom ----- #

# alias _ls="ls -Gd .*"
# alias _ll="ls -lhAG"
# alias _tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
# alias _tree_verbose="find . | sed -e 's/[^-][^\/]*\// |/g' -e 's/|\([^ ]\)/|-\1/'"

# bash
alias _cp='cp -i'
alias _mv='mv -i'
alias _rm='rm -i'
alias _rs="printf ':: reload shell :: \n';exec $SHELL -l;"

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
