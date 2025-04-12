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
