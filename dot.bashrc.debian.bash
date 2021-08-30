# dot.bashrc.debian.bash

# === java
export JAVA_HOME=$(/usr/libexec/java_home)

# === homebrew linux
export HOMEBREW_BUILD_FROM_SOURCE=1     # build from precompiled source via linux brew
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

# === bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# === homebrew github access
export HOMEBREW_GITHUB_API_TOKEN=<REPLACEME:xxxxxx>

# === keymap swap escape key with caps lock
setxkbmap -option "caps:swapescape"

# do not run using sudo
# dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:swapescape']"
# you can also edit this file cat /etc/default/keyboard  .. to change the XKBOPTIONS="" to XKBOPTIONS="caps:swapescape"
