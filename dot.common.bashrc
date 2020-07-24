# ===
# === common bashrc
# ===

printf "%s\t" ":: common : "
 
# ===
# === common env variables
# ===

printf "%s" "[+] envvars "

export NOW=$(date +"%Y%m%d-000000")                   # common
export EDITOR=vim                                     # common
export TERM=xterm-256color                            # common

# ===
# === apps and tools required settings
# ===

# ==> for android sdk
# export ANDROID_HOME=/usr/local/opt/android-sdk
# printf "%s" "[+] android "

# ==> for autojump
# https://github.com/wting/autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# ==> for homebrew ruby
printf "%s" "[+] ruby "

# export PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.7.0/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"

# ==> for fzf
# note that fzf will try to install this to default .bashrc too
# [ -f ~/.fzf.bash ] && source ~/.fzf.bash

# ==> added for jenv (http://www.jenv.be/)
# export PATH="$HOME/.jenv/bin:$PATH"
# eval "$(jenv init -)"

# ==> added for java
printf "%s" "[+] java "
if [ -z $JAVA_HOME ]; then
  export JAVA_HOME=$(/usr/libexec/java_home)
fi

# ==> added for n (node and yarn package mgr) default install to home folder
# export N_PREFIX=$HOME/n
# export PREFIX=$HOME/n

# ==> added for python3
printf "%s" "[+] python "
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# ===
# === git
# ===

printf "%s" "[+] git "

# ==> for git configurations
# default push branch to remote
# git config --global --add push.default current
cat ~/.gitconfig | grep "default = current" > /dev/null || git config --global --add push.default current

# appending additional git aliases
git config --global alias.alias "config --get-regexp alias"
git config --global alias.a "add -p"
git config --global alias.b "branch -a"
git config --global alias.c "commit"
git config --global alias.ca "commit --amend"
git config --global alias.co "checkout"
git config --global alias.cob "checkout -b"
git config --global alias.com "checkout master"
git config --global alias.f "fetch"
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global alias.p "pull"
git config --global alias.s "status"
git config --global alias.rbm "rebase master"

# ===
# === bash completions
# ===

printf "%s" "[+] completion "

# ==> checks if bash version is 5
if echo ${BASH_VERSION} | grep -q "^5\."; then
  printf "%s" "bash(v5+) "
else
  printf "%s" "bash(v?) "
fi

# # ==> added for make completion
# if [ -f ~/dot.bash-completion.make.bash ]; then
#   source ~/dot.bash-completion.make.bash
# fi

# ==> added for git completion
# # this should be added automatically if bash-completion@2 is installed
# if [ -f ~/dot.bash-completion.git.bash ]; then
#   source ~/dot.bash-completion.git.bash
# fi

# ===
# === aliases (type: "$ alias" to show current aliases)
# ===

printf "%s" "[+] aliases "

# ## ==> basic aliases

alias _fox="echo '
:: help ::

  _ls                           # list with colour
  _ll                           # list with permissions
  _tree                         # list tree
  _tree_verbose                 # list tree with files
  
  _rs                           # reload current shell

  _cp                           # cp with confirmation
  _mv                           # mv with confirmation
  _rm                           # rm with confirmation

  _fox_diff <file a> <file b>   # show diff between 2 or more files (use --brief for simple)
  _fox_emoshrug                 # emoji shrug
  _fox_fzf                      # fzf load with preview
  _fox_fzfvim                   # fzf load with preview and open with vim
  _fox_path                     # shows current path
  _fox_random                   # gives a random number
  
  _fox_aws                      # aws helpers
  _fox_docker                   # docker helpers
  _fox_file                     # file helpers (size/rename)
  _fox_git                      # git helpers
  _fox_graph                    # graph helpers
  _fox_sys                      # sysops helpers

  _fox_ssh_load                 # load default key to ssh agent
  _fox_ssh_keygen               # generates key pair ~/.ssh/id_rsa_standard (2048 bits)
  _fox_ssh_tunnel               # shows how to tunnel

  _fox_now                      # show date-time : echo \$(date +\"%Y%m%d-%H%M%S\");
  _fox_now_date                 # show date : echo \$(date +\"%Y%m%d\");
  _fox_now_time                 # show time : echo \$(date +\"%H%M%S\");


:: notes ::
  
  _fox_vim                      # vim hints

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
  printf "time \t\t\t $(fn_fox_now_time) \n"
  printf "ip (class c) \t\t $(fn_fox_network_getip) \n"
  printf "terminal encoding \t $(locale charmap) \n"
  printf "\n"
  printf "current user grps \t $(id) \n"
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

alias _fox_ssh_load="printf ':: loading default-key to agent :: \n';ssh-add;"
alias _fox_ssh_keygen="printf ':: generating standard sshkey :: \n';ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa_standard -C \"( $HOSTNAME : changeme@gmail.com ) \""
alias _fox_ssh_tunnel="printf ':: ssh tunnelling :: \n:: usage\t\t ssh -L 8080:www.google.com:80 172.10.10.10\n:: example\t\t ssh -L <local.port>:<target>:<target.port> <proxy>\n'; "

alias _ls="ls -Gd .*"
alias _ll="ls -lhAG"
alias _tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
alias _tree_verbose="find . | sed -e 's/[^-][^\/]*\// |/g' -e 's/|\([^ ]\)/|-\1/'"

alias _cp="cp -i"
alias _mv="mv -i"
alias _rm="rm -i"

alias _rs="printf ':: restarting shell :: \n';exec $SHELL -l;"

alias _fox_diff="diff -y --color"
alias _fox_emoshrug="echo '¯\_(ツ)_/¯'";
alias _fox_fzf="fzf --height=70% --preview=\"cat {}\" --preview-window=right:50%:wrap"
alias _fox_fzfvim="fzf --height=70% --preview=\"cat {}\" --preview-window=right:50%:wrap | xargs -o vim"
alias _fox_path="echo \$PATH | tr ':' '\n'"
alias _fox_random="echo ${RANDOM:0:2};"

alias _fox_now="fn_fox_now_date && fn_fox_now_time;"
alias _fox_now_date="fn_fox_now_date;"
alias _fox_now_time="fn_fox_now_time;"

# ## ==> aws

alias _fox_aws="echo '
:: help ::

  _fox_aws_check                                      # use sts to check connectivity
  _fox_aws_config                                     # show aws account configure
  _fox_aws_config_init                                # set up aws account using configuration
  _fox_aws_access_key_id <profile>                    # get aws key id
  _fox_aws_secret_access_key <profile>                # get aws secret access key
  _fox_aws_profile_ls                                 # list all profiles
  _fox_aws_profile_load <profile>                     # load profile

  _fox_aws_vault add <profile>                        # add new profile. check ~/.aws/config to verify profile arn
  _fox_aws_vault list                                 # list all profiles in aws vault
'"

alias _fox_aws_check="aws sts get-caller-identity"
alias _fox_aws_config="cat ~/.aws/config; cat ~/.aws/credentials;"
alias _fox_aws_config_init="mkdir -pv ~/.aws && aws configure;"
alias _fox_aws_access_key_id="aws configure get aws_access_key_id --profile;"
alias _fox_aws_secret_access_key="aws configure get aws_secret_access_key --profile;"
alias _fox_aws_profile_ls="fn_fox_aws_profile_show;"
alias _fox_aws_profile_load="fn_fox_aws_profile_load;"

fn_fox_aws_profile_load_now_datetime() {
  echo "$(date +\"%Y%m%d-%H%M%S\")";
}

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

# ## ==> docker

alias _fox_docker="echo '
:: help ::

  _fox_docker_ps                    # list all process
  _fox_docker_ps_less               # list all process (fit width)
  _fox_docker_ps_purge              # purge all processes
  _fox_docker_images                # list images
  _fox_docker_images_purge          # purge all images
  _fox_docker_volumes               # list all volumes

  _fox_docker_all_purge             # system prune (purge all containers and images)
  _fox_docker_sh <container id>     # shell sh into container
  _fox_docker_bash <container id>   # shell bash into container
  _fox_docker_logs <container id>   # show docker logs

  _fox_docker_stop <container id>   # stop container
'"

alias _fox_docker_ps="docker ps -a"
alias _fox_docker_ps_less="docker ps | less -S"
alias _fox_docker_ps_purge="fn_fox_docker_runningpurge;"
alias _fox_docker_images="docker images"
alias _fox_docker_images_purge="fn_fox_docker_imagepurge;"
alias _fox_docker_volumes="docker volume ls"

alias _fox_docker_purge="docker system prune"
alias _fox_docker_sh="fn_fox_docker_sh"
alias _fox_docker_bash="fn_fox_docker_bash"
alias _fox_docker_logs="docker logs"

alias _fox_docker_stop="echo ':: stopping running container ::'; fn_fox_docker_rmrunning"

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

# ## ==> file

alias _fox_file="echo '
:: help ::
  
  _fox_file_get                       # get file with curl
  
  _fox_file_namefix                   # rename file with default lower
  _fox_file_namelower                 # make file name lowercase

  _fox_file_size                      # show current directory size total
  _fox_file_size_all                  # show current directory size by each file
  _fox_file_size_1m                   # show files larger than 1mb in current dir
  _fox_file_size_10m                  # show files larger than 10mb in current dir
  _fox_file_size_100m                 # show files larger than 100mb in current dir

:: notes ::
'"

alias _fox_file_get="fn_fox_file_get"

alias _fox_file_namefix="fn_fox_file_namefix"
alias _fox_file_namelower="fn_fox_file_namelowercase"

alias _fox_file_size="du -shc ./*"
alias _fox_file_size_all="du -h"
alias _fox_file_size_1m="find . -type f -size +1M -exec ls -lh {} \;"
alias _fox_file_size_10m="find . -type f -size +10M -exec ls -lh {} \;"
alias _fox_file_size_100m="find . -type f -size +100M -exec ls -lh {} \;"

fn_fox_file_namefix() {
  local parsevar=$1
  # substitute brackets
  # substitute hypens
  printf "%s\n" "use following command: "
  printf "%s" "mv -i \"$parsevar\" "
  echo "$parsevar" | \
    awk '{ \
      # gsub(" ", "\\ ", $0); \
      # gsub("[()]", "", $0); \
      gsub(" ", "-", $0); \
      gsub("[()]", "", $0); \
      print tolower($0); \
    }'
}

fn_fox_file_namelowercase() {
  local parsevar=$1
  echo "$parsevar" | awk '{ print tolower($0) }'
}

fn_fox_file_get() {
  if [ -z "$1" ]; then
    cat << EOM
usage

  _fox_file_get <local location> <remote file>
  _fox_file_get "~/Desktop" "https://github.com/aws-vault/download/v4.7.1/amd64.dmg"

EOM
  else
    pushd $1 && curl -O $2 && popd;
  fi
}

# ## ==> git

alias _fox_git="echo '
:: help ::

  _git_config                   # show git config
  _git_show                     # fetch + show branch + show stash
  _git_diff                     # show difference between current and HEAD

  _git_ls                       # fetch and list all branches
  _git_ll                       # show log in pretty format
  _git_develop <branch>         # checkout develop and branch (feature/TICKET-123-myfeature)
  _git_staging <branch>         # checkout staging and branch
  _git_master <branch>          # checkout master and branch (hotfix/TICKET-123-myhotfix)
  _git_pull_all                 # try to checkout master/staging/develop and pull for all

:: notes ::

  git lg                                              # show fancy git history
  git a                                               # git add files verbose
  git c                                               # git add comment and commit
  git difftool                                        # runs default difftool
  git branch -r -d <remote:-github/stale-version>     # remove remote branch
  git reset --soft <git-sha>                          # resets to <sha> commit and preserve changes
  git reset --hard <branch>                           # reset/destroy current branch to mirror a peer <branch>
  git reset --hard HEAD~1                             # rollback/destroy the current commit
  git stash list                                      # show current stashes in project
  git stash pop                                       # apply stash to this branch and remove stash
  git stash apply                                     # apply stash to this branch
  git rebase master                                   # apply master branch as base on this branch
  git rebase -i <sha>~                                # interactive squash this branch from head to <sha>
  git checkout -                                      # checkout previous checked out branch

  branch master                 # tracks released code only - only merge from release (branches) or hotfix (branches)
  branch feature                # branch off develop (branch) ==> merged back to develop (branch) - feature/ticket-ref-xxx/my-feature
  branch release-yymmdd         # branch off develop (branch) ==> deploy to test env ==> merged back to develop (branch) and master (branch) - release/release-yymmdd
  branch hotfix                 # branch off tagged release in master (branch) ==> merged back to develop (branch) and master (branch)

  https://datasift.github.io/gitflow/IntroducingGitFlow.html
'"

alias _git_config="echo ':: showing gitconfig ::'; cat ~/.gitconfig;"
alias _git_show="git fetch --all --prune; printf '\n'; git branch --all -vv; printf '\n'; git status --show-stash -vv;"
alias _git_diff="echo ':: git changes - git diff head^ ::'; git diff head^;"

alias _git_ls="git fetch --all; git branch --all;"
alias _git_ll="git log --pretty='format:%C(yellow)%h%Creset - %Cgreen%>(12)%ad%Creset %C(bold blue)<%an>%Creset %s' --date=relative;"

alias _git_pull_all="git checkout master && git pull; git checkout staging && git pull; git checkout develop && git pull;"
alias _git_develop="git checkout develop;"
alias _git_staging="git checkout staging;"
alias _git_master="git checkout master;"

# ## ==> graph

# # sample.dot
# digraph test {
#      a -> b -> c;
#      b -> d;
#  }

alias _fox_graph="fn_fox_graph_help"

fn_fox_graph_help() {
  cat << EOF
usage

  _fox_graph
  _fox_graph_ascii <file>           # test

# example run using graph-easy
docker run -i tsub/graph-easy << EOF
digraph parent {

  lt [label="Laptop"]
  ti [label="The\nInternet"]

  lt -> ti

  subgraph child {
    lt -> ti
  }
}

EOF
}

alias _fox_graph_ascii="fn_fox_graph_ascii"

fn_fox_graph_ascii() {
  if [ -z "$1" ]; then
    cat << EOM
usage

  _fox_graph_ascii <file>

EOM
  else
    cat $1 | docker run -i tsub/graph-easy;
  fi
}

# ## ==> sys ops

alias _fox_sys="echo '
:: help ::

  _fox_sys_ls                   # show general system information + listening ports + processes
  _fox_sys_ps                   # show running processes

  _fox_sys_ip                   # show ip of en0
  _fox_sys_network              # show all network information
  _fox_sys_ports                # investigate listing ports
  _fox_sys_subnet               # show subnet for a range _subnet subnet.im/192.168.12.12/30
  _fox_sys_tcp                  # show tcp dump

:: notes ::

  ifconfig -a | grep ether      # get mac address
  ifconfig | grep inet          # get inet
'"

alias _fox_sys_ls="fn_fox_system;fn_fox_showmaclaunch;"
alias _fox_sys_ps="printf ':: showing running processes ::\n';ps -a;"

alias _fox_sys_ip="printf ':: show ip on en0 ::\n'; ifconfig en0 | grep inet;"
alias _fox_sys_network="fn_fox_network_info;"
alias _fox_sys_port="printf ':: investigate listening ports :: \n';sudo lsof -PiTCP -sTCP:LISTEN;"
alias _fox_sys_subnet="echo 'use curl subnet.im/192.168.12.12/30'"
alias _fox_sys_tcp="printf ':: show network interfaces ::\n'; tcpdump -D;"

fn_fox_network_info() {
  printf ":: about network (me) ::\n";
  printf "IP \t\t :"
  ifconfig | grep 'inet' | grep '192' | awk '{ print $2 }'
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

# ===
# === hints
# ===

# ## ==> ansible

alias _fox_ansible="echo '
:: help ::

  ansible -m setup <hostname>                                 # show all ansible variables for host
  ansible -m setup localhost                                  # show all ansible variables for localhost
'"

# ## ==> kubernetes

alias _fox_k8s="echo '
:: help ::

  # to launch new credentials
  rm ~/.kube/config;
  az aks get-credentials --subscription <subid> --name <clustername> -g <rgname>; # azure
  aws eks --region <region-code> update-kubeconfig --name <cluster_name>;         # aws

  kubectl                                                     # show all commands
  kubectl config view                                         # show all configuration
  kubectl config get-contexts                                 # show available configuration
  kubectl config current-context                              # show current configuration
  kubectl cluster-info                                        # show cluster info

  kubectl get namespaces                                      # show all namespaces (or get ns)

  kubectl get pods --all-namespaces                           # show pods from all namespaces
  kubectl get pods --namespace <namespace>                    # show pods from a namespace
  kubectl describe pods --namespace <namespace> <pod>         # show info of pod from a namespace

  kubectl get events --all-namespaces                         # show events from all namespaces
  kubectl get events --namespace <namespace>                  # show events from a namespace
  kubectl describe events --namespace <namespace> <event>     # show info of pod from a namespace

  kubectl get <option> --all-namespaces                       # show info for option
  option: services / pods / pv / configmap

  kubectl edit svc/docker-registry                            # edit resource
  kubectl logs --namespace <namespace> <pod>                  # view logs of pod
  kubectl delete --namespace <namespace> pod,service foo      # delete pod and services named foo
  kubectl exec <pod> -- ls /                                  # run command on pod (1 container)
  kubectl exec <pod> -c mycontainer -- ls /                   # run command on pod (multi container)

  kubectl apply -f ./my-manifest.yaml                         # create resource(s)
  kubectl apply -f https://git.io/openk8sresources            # create resource(s) from url
  kubectl create deployment nginx --image=nginx               # start a single instance of nginx

:: notes ::

  https://kubernetes.io/docs/reference/kubectl/cheatsheet/

'"

# ## ==> tmux

alias _fox_tmux="echo '
:: help ::

  tmux ls                                                     # list all sessions
  tmux info                                                   # show all info
  tmux new -s mynewsession                                    # start new tmux session with name
  ctrl-b                                                      # leader key

  ctrl-b s                                                    # session list
  ctrl-b $                                                    # session rename

  ctrl-b c                                                    # window create new
  ctrl-b ,                                                    # window rename
  ctrl-b <0-9>                                                # window jump window
  ctrl-b n / p                                                # window next / previous

  ctrl-b %                                                    # pane split vertical
  ctrl-b \"                                                   # pane split horizontal
  ctrl-b q                                                    # pane show pane number (query)
  ctrl-b q <0-9>                                              # pane switch to pane number
  ctrl-b o                                                    # pane switch to next pane
  ctrl-b <arrow direction>                                    # pane switch to pane

  ctrl-b [                                                    # pane/window scrolling on
  ctrl-b q                                                    # pane/window scrolling off
  :set -g mouse on                                            # turn on mouse scrolling

  :setw -g mode-keys vi                                       # use vi keys in buffer

:: notes ::

  https://tmuxcheatsheet.com/
'"

# ## ==> vim

alias _fox_vim="echo '
:: help ::

  hjkl                                                        # left - down - up - right

  :%s/<search>/<replace>/g                                    # search replace all
  :%s/<search>/<replace>/gc                                   # search replace all with confirmation
'"

# ===
# === bash loader end
# ===

# printf "%s\\n" "::"
# cat <<-EOF
# :: term size $(stty size) :: type 'alias' - to show aliases
# EOF
# do not indent, nor add anything after closing EOF

