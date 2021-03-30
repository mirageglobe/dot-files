# dotfile alias
## [ -f ~/dot-files/dot.bash.mac.alias.bashrc ] && source ~/dot-files/dot.bash.mac.alias.bashrc

# === aliases (type: "$ alias" to show current aliases)

printf "%s" "[+] aliases "

# === === overrides

alias cat='bat'
alias catcat='\cat'
alias ls='lsd'

# === === new aliases

# alias _ls="ls -Gd .*"
# alias _ll="ls -lhAG"
# alias _tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
# alias _tree_verbose="find . | sed -e 's/[^-][^\/]*\// |/g' -e 's/|\([^ ]\)/|-\1/'"

alias _cp='cp -i'
alias _mv='mv -i'
alias _rm='rm -i'

alias _rs="printf ':: reload shell :: \n';exec $SHELL -l;"

alias ll='lsd -la'
alias lt='lsd --tree'
alias tree='lsd --tree'

alias kc='kubectl config view --minify --output "jsonpath={.current-context}"; echo ""; echo "------------------------"; kubectl cluster-info;'

alias ibrew='arch -x86_64 /usr/local/bin/brew'
alias mbrew='arch -arm64e /opt/homebrew/bin/brew'

alias pg13start='pg_ctl -D /usr/local/var/postgresql start'
alias pg13stop='pg_ctl -D /usr/local/var/postgresql stop'

# === custom commands

# adding bat with gitdiff
batdiff() {
    git diff --name-only --diff-filter=d | xargs bat --diff
}
