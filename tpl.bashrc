# === usage
#
# add/replace this file as ~/.bashrc or  $HOME/.bashrc

# === === for linux ubuntu or debian ~/.bashrc
[ -f ~/dot-files/dot.common.bashrc ] && source ~/dot-files/dot.common.bashrc
[ -f ~/dot-files/dot.debian.bashrc ] && source ~/dot-files/dot.debian.bashrc
[ -f ~/dot-files/dot.fox.bashrc ] && source ~/dot-files/dot.fox.bashrc

# === === for mac ~/.bashrc
[ -f ~/dot-files/dot.common.bashrc ] && source ~/dot-files/dot.common.bashrc
[ -f ~/dot-files/dot.mac.bashrc ] && source ~/dot-files/dot.mac.bashrc
[ -f ~/dot-files/dot.fox.bashrc ] && source ~/dot-files/dot.fox.bashrc

# homebrew github api token
export HOMEBREW_GITHUB_API_TOKEN=<REPLACEME>

# homebrew doctor recommendation
export PATH="/usr/local/sbin:$PATH"
