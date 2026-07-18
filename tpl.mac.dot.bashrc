# ================================================ bash common env vars ===== #
# @public

# --------------------------------------------------------------- setup ----- #

# touch ~/.bashrc

# example for quick add to ~/.bashrc
# [ -f "$HOME/dot-files/tpl.mac.dot.bashrc" ] && source "$HOME/dot-files/tpl.mac.dot.bashrc"

# ----------------------------------------------------- common env vars ----- #

printf "%s" "[+] common "

export CLICOLOR=true
export GREP_OPTIONS='--color=auto'
export EDITOR=vim
export TERM=xterm-256color

# --------------------------------------------------------------- alias ----- #

printf "%s" "[+] aliases "

alias _cp='cp -i'
alias _mv='mv -i'
alias _rm='rm -i'
alias _rs="printf ':: reload shell :: \n';exec $SHELL -l;"
