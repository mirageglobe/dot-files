# dotfile completion
# [[ -f ~/dot-files/dot.bashrc.mac.completion.bash ]] && . "$HOME/dot-files/dot.bashrc.mac.completion.bash"

printf "%s" "[+] completion "

# check if bash version is 5
BASH_VERSION_3=true
BASH_VERSION_5=false

if echo "${BASH_VERSION}" | grep -q "^5\."; then
  BASH_VERSION_3=false
  BASH_VERSION_5=true
fi

if [[ $BASH_VERSION_5 ]]; then
  printf "%s" "- bash 5.x "
  # export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
  # [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
  # https://formulae.brew.sh/formula/bash-completion@2
  [[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && \
    . "$(brew --prefix)/etc/profile.d/bash_completion.sh" && \
    printf "%s" "loaded "
else
  printf "%s" "- bash 3.x "
fi

# bash 5 completion - add following to .bashrc to enable
# [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
# [[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"

# git completion - add following to .bashrc to enable
# [[ -f ~/dot-files/dot.completion.git.bash ]] && "$HOME/dot-files/dot.completion.git.bash"

# make completion - add following to .bashrc to enable
# [[ -f ~/dot-files/dot.bash-completion.make-menu.bash ]] && . "$HOME/dot-files/dot.bash-completion.make-menu.bash"
