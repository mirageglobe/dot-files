# dotfile envvar
## [ -f ~/dot-files/dot.bashrc.mac.envvar.bash ] && source ~/dot-files/dot.bashrc.mac.envvar.bash

printf "%s" "[+] envvars "

# bash
export CLICOLOR=true
export GREP_OPTIONS='--color=auto'                    # common
export NOW=$(date +"%Y%m%d-000000")                   # common
export EDITOR=vim                                     # common
export TERM=xterm-256color                            # common

# fzf settings - need to install fzf via brew and run /usr/local/opt/fzf/install to support cmdline
export FZF_COMPLETION_TRIGGER='??'

# github token
export GITHUB_TOKEN=CHANGEME

# homebrew github api token
export HOMEBREW_GITHUB_API_TOKEN=CHANGEME

# java adopt
if [ -z $JAVA_HOME ]; then
  printf "%s" "[+] java "
  export JAVA_HOME=$(/usr/libexec/java_home)
fi
