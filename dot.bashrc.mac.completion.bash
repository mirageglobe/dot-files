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
# # add following to .bashrc to enable
# if [ -f ~/dot-files/dot.completion.git.bash ]; then
#   source ~/dot-files/dot.completion.git.bash
# fi

# === === make completion
# # add following to .bashrc to enable
# if [ -f ~/dot-files/dot.bash-completion.make-menu.bash ]; then
#   source ~/dot-files/dot.bash-completion.make-menu.bash
# fi

# === bash loader end
