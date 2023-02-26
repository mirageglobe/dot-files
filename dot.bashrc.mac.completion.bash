# ============================================== bash config completion ===== #

# --------------------------------------------------------------- setup ----- #

# default config file locations:
#
# - mac/linux         ~/.bashrc
#                     ~/.bash_profile

# touch ~/.bashrc
# include the following in ~/.bashrc file
# assuming the source script is in ~/dot-files

# [ -f "$HOME/dot-files/dot.bashrc.mac.completion.bash" ] && source "$HOME/dot-files/dot.bashrc.mac.completion.bash"

# -------------------------------------------------------------- config ----- #

# show load status
printf "%s" "[+] completion "

# check if bash version
BASH_VERSION_3=false
BASH_VERSION_5=false

if echo "${BASH_VERSION}" | grep -q "3."; then
  BASH_VERSION_3=true
elif echo "${BASH_VERSION}" | grep -q "5."; then
  BASH_VERSION_5=true
fi

if [ $BASH_VERSION_3 = true ]; then
  printf "%s" "(bash 3.x) ";
elif [ $BASH_VERSION_5 = true ]; then
  printf "%s" "(bash 5.x) ";
  # load bash compatible directory (legacy completion scripts default)
  export bash_completion_compat_dir="/usr/local/etc/bash_completion.d"
  # homebrew bash-completion@2 - https://formulae.brew.sh/formula/bash-completion@2
  [[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && source "$(brew --prefix)/etc/profile.d/bash_completion.sh"
else
  printf "%s" "(bash n/a) ";
fi

# -------------------------------------------------- custom completions ----- #

# fzf # path: file completion / dir: directory completion
# _fzf_setup_completion path rg git kubectl rm cat
# _fzf_setup_completion dir cd

# kubectl
# if command -V kubectl 1> /dev/null; then
#   source <(kubectl completion bash)
# fi

# yq
# if command -V yq 1> /dev/null; then
#   source <(yq shell-completion bash)
# fi

# git completion - add following to .bashrc to enable
# [ -f "$HOME/dot-files/dot.completion.git.bash" ] && source "$HOME/dot-files/dot.completion.git.bash"

# make completion - add following to .bashrc to enable
# [ -f "$HOME/dot-files/dot.bash-completion.make-menu.bash" ] && source "$HOME/dot-files/dot.bash-completion.make-menu.bash"
