# dotfile envvar
## [ -f ~/dot-files/dot.bashrc.mac.envvar.bash ] && source ~/dot-files/dot.bashrc.mac.envvar.bash

printf "%s" "[+] envvars "

# bash
export CLICOLOR=true
export GREP_OPTIONS='--color=auto'                  # common
export NOW=$(date +"%Y%m%d-000000")                 # common
export EDITOR=vim                                   # common
export TERM=xterm-256color                          # common

# fzf settings
# - ensure install fzf via brew
# - to support terminal and keybindings, run : /usr/local/opt/fzf/install
export FZF_COMPLETION_TRIGGER='??'                                      # keybind fzf trigger
export FZF_COMPLETION_OPTS='--height 80% --border --info=inline'        # apply fzf flags as default for completion
export FZF_DEFAULT_OPTS='--height 80% --border --info=inline'           # apply fzf flags as default for command, do not add preview

# github token
export GITHUB_TOKEN=CHANGEME

# homebrew github api token
export HOMEBREW_GITHUB_API_TOKEN=CHANGEME

# java
# use sdkman.io to install temurin (adoptopenjdk replacement)
# - sdk install java 17.0.0-tem
# if [ -z $JAVA_HOME ]; then
#   printf "%s" "[+] java "
#   export JAVA_HOME=$(/usr/libexec/java_home)
# fi
