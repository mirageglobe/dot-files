# ============================================== bash config completion ===== #

# --------------------------------------------------------------- setup ----- #

# touch ~/.bashrc

# example for quick add to ~/.bashrc
# include the following in ~/.bashrc file, assuming the source script is in ~/dot-files

# bash completion common for mac/linux
# [ -f "$HOME/dot-files/tpl.mac.completion.dot.bash" ] && source "$HOME/dot-files/tpl.mac.completion.dot.bash"

# -------------------------------------------------------------- config ----- #

# the following completion script checks for bash version and loads legacy bash
# completion scripts.

# requires bash version 3.2 or later and homebrew bash-completion@2

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

# to add other completions, add to the following file

# git completion - add following to .bashrc to enable
# [ -f "$HOME/dot-files/tpl.completion.git.dot.bash" ] && source "$HOME/dot-files/tpl.completion.git.dot.bash"

# make completion - add following to .bashrc to enable
# [ -f "$HOME/dot-files/tpl.completion.make.dot.bash" ] && source "$HOME/dot-files/tpl.completion.make.dot.bash"
