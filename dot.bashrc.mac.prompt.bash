# ================================================== bash config prompt ===== #

# --------------------------------------------------------------- setup ----- #

# default config file locations:
#
# - mac/linux         ~/.bashrc
#                     ~/.bash_profile

# touch ~/.bashrc
# include the following in ~/.bashrc file
# assuming the source script is in ~/dot-files

# [ -f "$HOME/dot-files/dot.bashrc.mac.prompt.bash" ] && source "$HOME/dot-files/dot.bashrc.mac.prompt.bash"

# -------------------------------------------------------------- config ----- #

# show load status
printf "%s" "[+] prompt "

# ------------------------------------------------------------- colours ----- #

# https://www.cyberciti.biz/tips/howto-linux-unix-bash-shell-setup-prompt.html
# https://www.cyberciti.biz/faq/bash-shell-change-the-color-of-my-shell-prompt-under-linux-or-unix/
# https://www.shellhacks.com/bash-colors/
# https://www.nerdfonts.com/cheat-sheet

# basic vanilla prompt - black 0;30 - red 0;31 - green 0;32 - brown 0;33 - blue 0,34 - purple 0;35 - cyan 0;36
# to get lighter version, replace 0 with 1
#
# begin color modifications - \e[31m      # where 31 is the color code
# end color modifications - \e[0m

C_BLACK="\[\e[0;30m\]"          # black
C_BLACKL="\[\e[1;30m\]"         # black (same)
C_BLUE="\[\e[0;34m\]"           # blue
C_BLUEL="\[\e[1;34m\]"
C_GREEN="\[\e[0;32m\]"
C_GREENL="\[\e[1;32m\]"
C_PURPLE="\[\e[0;35m\]"         # purple
C_PURPLEL="\[\e[1;35m\]"        # pink
C_RED="\[\e[0;31m\]"
C_REDL="\[\e[1;31m\]"
C_WHITE="\[\e[0;0m\]"
C_WHITEL="\[\e[1;0m\]"
C_YELLOW="\[\e[0;33m\]"
C_YELLOWL="\[\e[1;33m\]"
C_END="\[\e[m\]"

# ----------------------------------------------------------- functions ----- #

# check current folder
fn_prompt_get_current_folder() {
  echo "$(basename $PWD)";
}

# git check
fn_prompt_git_branch() {
  # git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
  # ref : https://stackoverflow.com/questions/8914435/awk-sed-how-to-remove-parentheses-in-simple-text-file
  # git branch 2> /dev/null | grep "\*" | awk '{ print $2 }' #| awk -v FS="[()]" '{ for (i=2;i<=NF;i+=2) print $i }'
  git branch 2> /dev/null | grep "\*" | awk '{ printf " "; printf $2; printf " "; }'
}

# aws check
fn_prompt_aws() {
  env 2> /dev/null | grep 'AWS_REGION' | awk '{ printf " aws "; printf ENVIRON["AWS_REGION"]; printf " "; printf ENVIRON["AWS_PROFILE"]; printf " "; }'
}

# ---------------------------------------------------------------- main ----- #

# prompt contents
PROMPT_EXTEND="\
${C_PURPLEL} ${C_END} \
${C_PURPLE} \$(whoami)(\${UID}) ${C_END}\
${C_BLUE} \$(pwd) ${C_END}\
${C_BLUEL} \$(fn_prompt_get_current_folder) ${C_END}\
${C_GREEN}\$(fn_prompt_git_branch)${C_END}\
${C_RED}\$(fn_prompt_aws)${C_END}\
${C_PURPLEL} ${C_END} \
"

# load prompt
export PS1="\n ${PROMPT_EXTEND}\n ${C_PURPLEL}  ${C_END}"
# export PS1="\u@\h \W\[\033[32m\]\$(fn_prompt_get_git_branch)\[\033[00m\] \$ "       # override with normal prompt

# -------------------------------------------------------------- custom ----- #

# starship.rs
# eval "$(starship init bash)"

# zoxide
# eval "$(zoxide init bash)"
