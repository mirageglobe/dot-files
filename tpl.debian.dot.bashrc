# ================================================== bash config debian ===== #

# --------------------------------------------------------------- setup ----- #

# default config file locations:
#
# - mac/linux         ~/.bashrc
#                     ~/.bash_profile

# - debian/ubuntu     ~/.bashrc
#                     ~/.bash_profile

# this file is a template for linux based os bashrc

# -------------------------------------------------------- installation ----- #

# install with copying this file to ~/.bashrc
# cp -i tpl.dot.bashrc ~/.bashrc

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
# export HOMEBREW_GITHUB_API_TOKEN=CHANGEME

# java
# use sdkman.io to install temurin (adoptopenjdk replacement)
# example: sdk install java 17.0.0-tem
# if [ -z $JAVA_HOME ]; then
#   printf "%s" "[+] java "
#   export JAVA_HOME=$(/usr/libexec/java_home)
# fi
