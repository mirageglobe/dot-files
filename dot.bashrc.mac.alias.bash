# dot.bashrc.mac.alias.bash
# bash mac alias
# [ -f ~/dot-files/dot.bash.mac.alias.bashrc ] && source ~/dot-files/dot.bash.mac.alias.bashrc

# alias (type: `alias` to show current aliases)
printf "%s" "[+] aliases "

# ---------------------------------------------------------------- overrides ---

alias cat='bat'
alias catcat='\cat'
alias ls='lsd'

# -------------------------------------------------------------- new aliases ---

# alias _ls="ls -Gd .*"
# alias _ll="ls -lhAG"
# alias _tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
# alias _tree_verbose="find . | sed -e 's/[^-][^\/]*\// |/g' -e 's/|\([^ ]\)/|-\1/'"

alias _cp='cp -i'
alias _mv='mv -i'
alias _rm='rm -i'
alias _rs="printf ':: reload shell :: \n';exec $SHELL -l;"

# lsd
alias ll='lsd -la'
alias lt='lsd --tree'
alias tree='lsd --tree'

# k8s
alias kc='kubectl config view --minify --output "jsonpath={.current-context}"; echo ""; echo "------------------------"; kubectl cluster-info;'

# homebrew
alias brewi='arch -x86_64 /usr/local/bin/brew'
alias brewm='arch -arm64e /opt/homebrew/bin/brew'

# postgresql
alias pgstart='pg_ctl -D /usr/local/var/postgresql start'
alias pgstop='pg_ctl -D /usr/local/var/postgresql stop'

# === custom commands

gitdiff() {
    # use bat output with git diff
    git diff --name-only --diff-filter=d | xargs bat --diff
}
