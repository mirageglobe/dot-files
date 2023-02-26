# ================================================ bash config env vars ===== #

# --------------------------------------------------------------- setup ----- #

# default config file locations:
#
# - mac/linux         ~/.bashrc
#                     ~/.bash_profile

# touch ~/.bashrc
# include the following in ~/.bashrc file
# assuming the source script is in ~/dot-files

# [ -f "$HOME/dot-files/dot.bashrc.mac.envvar.bash" ] && source "$HOME/dot-files/dot.bashrc.mac.envvar.bash"

# -------------------------------------------------------------- config ----- #

# show load status
printf "%s" "[+] envvars "

# ----------------------------------------------------- common env vars ----- #

export CLICOLOR=true
export GREP_OPTIONS='--color=auto'                  # common
export NOW=$(date +"%Y%m%d-000000")                 # common
export EDITOR=vim                                   # common
export TERM=xterm-256color                          # common

# ----------------------------------------------------------------- fzf ----- #

# ensure install fzf via brew
# to support terminal and keybindings, run : /usr/local/opt/fzf/install
export FZF_COMPLETION_TRIGGER='??'                                      # keybind fzf trigger
export FZF_COMPLETION_OPTS='--height 30% --border --info=inline'        # apply default flags for completion
export FZF_DEFAULT_OPTS='--height 30% --border --info=inline'           # apply default flags for command, do not add preview

# ---------------------------------------------------------------- java ----- #

# use sdkman.io to install temurin (adoptopenjdk replacement)
# example: sdk install java 17.0.0-tem
#
# if [ -z $JAVA_HOME ]; then
#   printf "%s" "[+] java "
#   export JAVA_HOME=$(/usr/libexec/java_home)
# fi
