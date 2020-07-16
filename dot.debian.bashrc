
# added for java
# export JAVA_HOME=$(/usr/libexec/java_home)

# Added for HomeBrew Linux
export HOMEBREW_BUILD_FROM_SOURCE=1     # build from precompiled source via linux brew
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

# Added for bash completion
# if [ -f $(brew --prefix)/etc/bash_completion ]; then
#   . $(brew --prefix)/etc/bash_completion
# fi

# Added for HomeBrew github access
# export HOMEBREW_GITHUB_API_TOKEN=<REPLACEME:xxxxxx>

# Added for swapping escape key into caps

setxkbmap -option "caps:swapescape"

# do not run using sudo
# dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:swapescape']"
# you can also edit this file cat /etc/default/keyboard  .. to change the XKBOPTIONS="" to XKBOPTIONS="caps:swapescape"
