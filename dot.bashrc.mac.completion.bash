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

# === === make completion
# if [ -f ~/dot.bash-completion.make.bash ]; then
#   source ~/dot.bash-completion.make.bash
# fi

# === bash loader end
