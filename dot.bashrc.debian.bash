# ================================================== bash config debian ===== #

# --------------------------------------------------------------- setup ----- #

# default config file location are:
#
# - mac/linux         ~/.bashrc
#                     ~/.bash_profile

# touch ~/.bashrc
# include the following in ~/.bashrc file
# assuming the source script is in ~/dot-files
#
# [[ -f $HOME/dot-files/dot.bashrc.debian.bash ]] && source "$HOME/dot-files/dot.bashrc.debian.bash"

# -------------------------------------------------------------- config ----- #

# map escape key with caps lock
setxkbmap -option "caps:swapescape"

# or write to file (do not run using sudo)
# dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:swapescape']"

# or edit "/etc/default/keyboard"
# XKBOPTIONS="" to XKBOPTIONS="caps:swapescape"

# bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

# homebrew linux
export HOMEBREW_BUILD_FROM_SOURCE=1     # build from precompiled source via linux brew
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

# homebrew github token
export HOMEBREW_GITHUB_API_TOKEN=<REPLACEME:xxxxxx>

# java
export JAVA_HOME=$(/usr/libexec/java_home)
