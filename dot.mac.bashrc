# ===
# === first time setup
# ===

# ==> enter following for mac .bash_profile
# if [ -f ~/.profile ]; then
#   source ~/.profile
# fi
#
# if [ -f ~/.bashrc ]; then
#   source ~/.bashrc
# fi

# ==> enter following for mac .bashrc
# if [ -f ~/dot.mac.bashrc ]; then
#   source ~/dot.mac.bashrc
# fi

# ===
# === bash loader
# ===

# ==> starting loader
printf "%s" ":: load bashrc : "

# ==> mac specific
# for super fast key repeat rate (keyboard)
# echo "defaults write NSGlobalDomain KeyRepeat -int 0"

# ===
# === common env variables
# ===
printf "%s" "[+] envvars "

export NOW=$(date +"%Y%m%d-000000")                   # common
export EDITOR=vim                                     # common
export TERM=xterm-256color                            # common

export GREP_OPTIONS='--color=auto'                    # common
export CLICOLOR=true                                  # common (mac only)

# ==> added for AWS (default temp)
# export AWS_DEFAULT_PROFILE=default
# export AWS_PROFILE=default
# export AWS_DEFAULT_REGION=us-east-1
# export AWS_ACCESS_KEY_ID=default
# export AWS_SECRET_ACCESS_KEY=default

# ===
# === setting custom prompt (default)
# ===

# ref - https://www.cyberciti.biz/tips/howto-linux-unix-bash-shell-setup-prompt.html
printf "%s" "[+] prompt "

export PROMPT_THEME=default
export PROMPT_SETTING=""
export PROMPT_GIT=1

# ==> aws prompt method
# appends the prompt in sequence, according to following conditionals
# note : this cannot be set as bashrc loads a new process. AWS is only valid in current terminal
if [ -z "$AWS_PROFILE" ]; then
# if [[ "$AWS_PROFILE" != "default" ]]; then
  # prompt + aws
  PROMPT_SETTING="$PROMPT_SETTING aws($AWS_PROFILE)"
fi

# ==> git prompt method
parse_git_branch() {
  # git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
  # ref : https://stackoverflow.com/questions/8914435/awk-sed-how-to-remove-parentheses-in-simple-text-file
  # git branch 2> /dev/null | grep "\*" | awk '{ print $2 }' #| awk -v FS="[()]" '{for (i=2;i<=NF;i+=2) print $i }'
  git branch 2> /dev/null | grep "\*" | awk '{ printf " ";printf $2; }'
}

if [[ "$PROMPT_GIT" ]]; then
  # basic vanilla prompt - black 0;30 - red 0;31 - green 0;32 - brown 0;33 - blue 0,34 - purple 0;35 - cyan 0;36
  # to get lighter version, replace 0 with 1
  #
  # begin color modifications - \e[31m      # where 31 is the color code
  # end color modifications - \e[0m
  # 
  # references
  # - https://www.cyberciti.biz/faq/bash-shell-change-the-color-of-my-shell-prompt-under-linux-or-unix/
  # - https://www.shellhacks.com/bash-colors/
  #
  # PROMPT_SETTING="$PROMPT_SETTING\[\033[32m\]\$(parse_git_branch)\[\033[00m\]"
  PROMPT_SETTING="$PROMPT_SETTING\e[0;32m\$(parse_git_branch)\e[m"
fi

# ==> setting final prompt on prompt
# export PS1="\W @ \h [\u] $ "
# export PS1="\W$PROMPT_SETTING\e[0;35m \$ \e[m"
# export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] \$ "
# export PS1=" \e[35m\$UID\e[0m:: \e[1;34m\$(fn_fox_sys_get_current_folder)\e[0m:: \e[32m\$(parse_git_branch)\e[0m\$ "
# export PS1=" \$UID:: \$(fn_fox_sys_get_current_folder):: \$(parse_git_branch)\$ "
# export PS1=" ${COLOR_PURPLE}${UID}${COLOR_WHITE}:: ${COLOR_BLUE} \$(fn_fox_sys_get_current_folder)\[\e[1;0m\]::\[\e[0;32m\]\$(parse_git_branch)\[\e[1;0m\] \$ "

COLOR_PURPLE="\[\e[0;35m\]"
COLOR_BLUE="\[\e[1;34m\]"
COLOR_GREEN="\[\e[0;32m\]"
COLOR_WHITE="\[\e[1;0m\]"

export PS1=" ${COLOR_PURPLE}${UID}${COLOR_WHITE}:: ${COLOR_BLUE}\$(fn_fox_sys_get_current_folder)${COLOR_WHITE}::${COLOR_GREEN}\$(parse_git_branch)${COLOR_WHITE} \$ "

# ===
# === apps and tools required settings
# ===

# ==> added for n (node and yarn package mgr) default install to home folder
# export N_PREFIX=$HOME/n
# export PREFIX=$HOME/n

# ==> git configurations
# appending additional git aliases
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# ==> added for fzf
# note that fzf will try to install this to default .bashrc too
# [ -f ~/.fzf.bash ] && source ~/.fzf.bash

# ==> added for jenv (http://www.jenv.be/)
# export PATH="$HOME/.jenv/bin:$PATH"
# eval "$(jenv init -)"

# ==> added for java
# export JAVA_HOME=$(/usr/libexec/java_home)
# printf "%s" "[+] java "

# ==> added for android sdk
# export ANDROID_HOME=/usr/local/opt/android-sdk
# printf "%s" "[+] android "

# ===
# === bash completions
# ===

printf "%s" "[+] bashcompletion "

# ==> added for make completion
if [ -f ~/dot.bash-completion.make.bash ]; then
  source ~/dot.bash-completion.make.bash
fi

# ==> added for git completion
# # this should be added automatically if bash-completion@2 is installed
if [ -f ~/dot.bash-completion.git.bash ]; then
  source ~/dot.bash-completion.git.bash
fi

# ===
# === aliases (type: "$ alias" to show current aliases)
# ===

printf "%s" "[+] aliases "

# ==> system and network related

alias _fox_sys="echo '
:: help systems and network ::

  _sys                          # show general system information + listening ports + processes
  _sysps                        # show running processes

  _net                          # show all network information
  _netiport                     # investigate listing ports
  _netint                       # show network interfaces
  _netip                        # show ip of en0

:: others ::

  ifconfig -a | grep ether      # get mac address
  ifconfig | grep inet          # get inet
'"

fn_fox_network_info() {
  printf ":: about network (me) ::\n";
  printf "IP \t\t :"
  ifconfig | grep 'inet' | grep '192' | awk '{print $2}'
  # ifconfig | grep inet;
  printf ":: list open files/processes and corresponding ports :: \n";
  sudo lsof -PiTCP -sTCP:LISTEN;
  # lsof -i | grep "LISTEN";
  # printf ":: listening ports :: app-process- \n";
  # lsof -Pi | grep "LISTEN";
}

fn_fox_network_getip() {
# caveat - shows only range 192.x.x.x networks
# class c/24 b/16 c/8
  ifconfig | grep 'inet' | grep '192' | awk '{ print $2 }'
}

fn_fox_showmaclaunch() {
  printf "\n:: load listening apps/ports (this will take a while) ::\n"
  lsof -Pi | grep "LISTEN\|PID";
  # launchctl list;
  printf "\n:: apps (excluding apple - com.apple) :: to remove run - launchctl remove <name_from_list_command>\n"
  launchctl list | grep -v "com.apple";
}

alias _sys="fn_fox_system;fn_fox_showmaclaunch;"
alias _sysps="printf ':: showing running processes ::\n';ps -a;"

alias _net="fn_fox_network_info;"
alias _netiport="printf ':: investigate listening ports :: \n';sudo lsof -PiTCP -sTCP:LISTEN;"
alias _netint="printf ':: show network interfaces ::\n'; tcpdump -D;"
alias _netip="printf ':: show ip on en0 ::\n'; ifconfig en0 | grep inet;"

# ## ==> shell

alias _fox="echo '
:: help common tools ::

  _ssh                          # load default key to ssh agent
  _sshkeygen                    # generates key pair ~/.ssh/id_rsa_standard (2048 bits)

  _rs                           # restarting current shell
  _ls                           # list with colour
  _ll                           # list with permissions
  _lh                           # list hidden only
  _size                         # show current directory size each
  _sizeall                      # show current directory size total
  _size1m                       # show files larger than 1mb in current dir
  _size10m                      # show files larger than 10mb in current dir
  _size100m                     # show files larger than 100mb in current dir

  _now                          # show date-time : echo \$(date +\"%Y%m%d-%H%M%S\");
  _nowdate                      # show date : echo \$(date +\"%Y%m%d\");
  _nowtime                      # show time : echo \$(date +\"%H%M%S\");

  _tree <directory>             # list 1 level tree
  _diff <file a> <file b>       # show diff between 2 or more files (use --brief for simple)
  _fzf                          # fzf load only 50 percent of screen

  _emo_shrug                    # emoji shrug

:: notes ::

  status codes
  - 1xx (info)
  - 2xx (success) - 200 (ok)
  - 3xx (redirection)
  - 4xx (client side) - 404 (not found) - 403 (forbidden) 
  - 5xx (server side) - 503 (service unavailable) - 504 (gateway timeout)
'"

fn_fox_system() {
  printf ":: system information :: \n"
  printf "date \t\t\t $(fn_fox_now_date) \n"
  printf "date time \t\t $(fn_fox_now_datetime) \n"
  printf "ip (class c) \t\t $(fn_fox_network_getip) \n"
  printf "terminal encoding \t $(locale charmap) \n"
  printf "\n"
  printf "current user grps \t $(id) \n"
}

fn_fox_aws_profile_load_now_datetime() {
  echo "$(date +\"%Y%m%d-%H%M%S\")";
}

fn_fox_now_date() {
  echo "$(date +\"%Y%m%d\")";
}

fn_fox_now_time() {
  echo "$(date +\"%H%M%S\")";
}

fn_fox_sys_get_current_folder() {
  # printf '%s\n' "${PWD##*/}";
  echo "$(basename $PWD)";
}

alias _ssh="printf ':: loading default-key to agent :: \n';ssh-add;"
alias _sshkeygen="printf ':: generating standard sshkey :: \n';ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa_standard -C \"( $HOSTNAME : changeme@gmail.com ) \""

alias _rs="printf ':: restarting shell :: \n';exec $SHELL -l;"
alias _ls="ls -G"
alias _ll="ls -lhAG"
alias _lh="ls -Gd .*"

alias _size="du -h"
alias _sizeall="du -sh"
alias _size1m="find . -type f -size +1M -exec ls -lh {} \;"
alias _size10m="find . -type f -size +10M -exec ls -lh {} \;"
alias _size100m="find . -type f -size +100M -exec ls -lh {} \;"

alias _random="echo ${RANDOM:0:2};"
alias _now="fn_fox_now_datetime;"
alias _nowdate="fn_fox_now_date;"
alias _nowtime="fn_fox_now_time;"

alias _tree="tree -C -L 1"
alias _diff="diff -y"
alias _fzf="fzf --height=50%"

alias _emo_shrug="echo '¯\_(ツ)_/¯'";

# ## ==> git

alias _fox_git="echo '
:: help git ::

  _gconf                        # show git config
  _gcm                          # git add comment and commit
  _gs                           # fetch + show branch + show stash
  _gch                          # show difference between current and HEAD

  _git_ls                       # fetch and list all branches
  _git_develop <branch>         # checkout develop and branch (feature/TICKET-123-myfeature)
  _git_staging <branch>         # checkout staging and branch
  _git_master <branch>          # checkout master and branch (hotfix/TICKET-123-myhotfix)
  _git_pullall                  # try to checkout master/staging/develop and pull for all

  _gll                          # show log in pretty format

:: others ::

  git lg                                              # show fancy git history
  git difftool                                        # runs default difftool
  git branch -r -d <remote:-github/stale-version>     # remove remote branch
  git reset --soft <git-sha>                          # resets to historic commit
  git reset --hard <branch>                           # resets current branch to mirror a peer <branch>
  git reset --hard HEAD~1                             # rollback the commit
  git stash list                                      # show current stashes in project

:: ref ::

  branch master                 # tracks released code only - only merge from release (branches) or hotfix (branches)
  branch feature                # branch off develop (branch) ==> merged back to develop (branch) - feature/ticket-ref-xxx/my-feature
  branch release-yymmdd         # branch off develop (branch) ==> deploy to test env ==> merged back to develop (branch) and master (branch) - release/release-yymmdd
  branch hotfix                 # branch off tagged release in master (branch) ==> merged back to develop (branch) and master (branch)

  https://datasift.github.io/gitflow/IntroducingGitFlow.html
'"

alias _gconf="echo ':: showing gitconfig ::'; cat ~/.gitconfig;"
alias _gcm="echo ':: git add --all and git commit -m ::'; git add --all && git commit -m"
alias _gs="git fetch --all --prune; printf '\n'; git branch --all -vv; printf '\n'; git status --show-stash -vv;"
alias _gch="echo ':: git changes - git diff head^ ::'; git diff head^;"

alias _gll="git log --pretty='format:%C(yellow)%h%Creset - %Cgreen%>(12)%ad%Creset %C(bold blue)<%an>%Creset %s' --date=relative;"

alias _git_ls="git fetch --all; git branch --all;"
alias _git_pull_all="git checkout master && git pull; git checkout staging && git pull; git checkout develop && git pull;"
alias _git_develop="git checkout develop;"
alias _git_staging="git checkout staging;"
alias _git_master="git checkout master;"

# ## ==> docker

alias _fox_docker="echo '
:: help docker ::

  _dc_ps                        # list all process
  _dc_psless                    # list all process (fit width)
  _dc_pspurge                   # purge all processes
  _dc_img                       # list images
  _dc_imgpurge                  # purge all images
  _dc_vol                       # list all volumes

  _dc_purge                     # system prune (purge all containers and images)
  _dc_ssh <container id>        # shell ssh into container (default bash)
  _dc_sh <container id>         # shell sh into container
  _dc_bash <container id>       # shell bash into container
  _dc_logs <container id>       # show docker logs

  _dc_stop <container id>       # stop container
'"

fn_fox_docker_imagepurge(){
  # printf ":: removing dangling images :: \n";
  # docker rmi $(docker images --filter "dangling=true" -q --no-trunc);
  docker rmi $(docker images -a -q);
}

fn_fox_docker_runningpurge() {
  printf ":: stopping and removing running docker containers :: \n";
  docker stop $(docker ps -aq);
  docker rm $(docker ps -aq);
}

fn_fox_docker_rmrunning() {
  printf ":: stopping container ::\n";
  docker stop $1; docker rm $1;
}

fn_fox_docker_sh() {
  printf ":: sh into container ::\n";
  docker exec -it $1 sh;
}

fn_fox_docker_bash() {
  printf ":: (ba)sh into container ::\n";
  docker exec -it $1 bash;
}

alias _dc_ps="docker ps -a"
alias _dc_psless="docker ps | less -S"
alias _dc_pspurge="fn_fox_docker_runningpurge;"
alias _dc_img="docker images"
alias _dc_imgpurge="fn_fox_docker_imagepurge;"
alias _dc_vol="docker volume ls"

alias _dc_purge="docker system prune"
alias _dc_ssh="fn_fox_docker_bash"
alias _dc_sh="fn_fox_docker_sh"
alias _dc_bash="fn_fox_docker_bash"
alias _dc_logs="docker logs"

alias _dc_stop="echo ':: stopping running container ::'; fn_fox_docker_rmrunning"

# ## ==> aws

alias _fox_aws="echo '
:: help aws ::

  _fox_aws_config                                     # show aws account configure
  _fox_aws_config_init                                # set up aws account using configuration
  _fox_aws_access_key_id <profile>                    # get aws key id
  _fox_aws_secret_access_key <profile>                # get aws secret access key
  _fox_aws_profile_ls                                 # list all profiles
  _fox_aws_profile_load <profile>                     # load profile
'"

fn_fox_aws_profile_load() {
  printf ":: loading aws profile(s) : $1 ::\n";
  cat ~/.aws/credentials | grep $1; # check if user exists in credentials
  export AWS_DEFAULT_PROFILE=$1;
  export AWS_PROFILE=$1;
  export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id --profile $1);
  export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key --profile $1);
  export AWS_DEFAULT_REGION=$(aws configure get region --profile $1);
  printf ":: checking loaded variables for $1 ::\n";
  aws configure list;
}

fn_fox_aws_profile_show() {
  printf ":: showing aws profile available ::\n\n";
  cat ~/.aws/credentials | grep '\[';
  printf "\n"
  printf ":: showing aws profile loaded ::\n\n";
  aws configure list;
  printf "\n"
}

alias _fox_aws_config="cat ~/.aws/config; cat ~/.aws/credentials;"
alias _fox_aws_config_init="mkdir -pv ~/.aws && aws configure;"
alias _fox_aws_access_key_id="aws configure get aws_access_key_id --profile;"
alias _fox_aws_secret_access_key="aws configure get aws_secret_access_key --profile;"
alias _fox_aws_profile_ls="fn_fox_aws_profile_show;"
alias _fox_aws_profile_load="fn_fox_aws_profile_load;"

# ## ==> graphing using dot

# # sample.dot
# digraph test {
#      a -> b -> c;
#      b -> d;
#  }

fn_fox_graph() {
  if [ -z "$1" ]; then
    echo "usage : _fox_graph <file>"
  else
    cat $1 | docker run -i tsub/graph-easy;
  fi
}

alias _fox_graph="fn_fox_general_graph"

# ## ==> get file with curl

fn_fox_file_get() {
  # usage : _fox_get [local location] [remote file]
  # example _fox_get "~/Desktop" "https://github.com/99designs/aws-vault/releases/download/v4.7.1/aws-vault-darwin-amd64.dmg"
  pushd $1 && curl -O $2 && popd;
}

alias _fox_file_get="fn_fox_get"

# ===
# === bash loader end
# ===

printf "%s\\n" "::"
printf "%s\\n\\n" ":: term size $(stty size) :: type 'alias' - to show aliases"

