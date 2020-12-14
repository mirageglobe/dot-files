# === === basic fox

alias _fox="echo '
:: help ::

  _fox_diff <file a> <file b>   # show diff between 2 or more files (use --brief for simple)
  _fox_emoshrug                 # emoji shrug
  _fox_fzf                      # fzf load with preview
  _fox_fzfvim                   # fzf load with preview and open with vim
  _fox_path                     # shows current path
  _fox_random                   # gives a random number

  _fox_aws                      # aws helper
  _fox_docker                   # docker helper
  _fox_file                     # file helper (size/rename)
  _fox_git                      # git helper / hints
  _fox_graph                    # graph helper / hints
  _fox_ssh                      # ssh ssl helper / hints
  _fox_sys                      # sysops helper

  _fox_now                      # show date-time : echo \$(date +\"%Y%m%d-%H%M%S\");
  _fox_now_date                 # show date : echo \$(date +\"%Y%m%d\");
  _fox_now_time                 # show time : echo \$(date +\"%H%M%S\");

  _fox_bash                     # bash shell hints
  _fox_k8s                      # k8s hints
  _fox_tmux                     # tmux hints
  _fox_vim                      # vim hints

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

alias _fox_diff="diff -y --color"
alias _fox_emoshrug="echo '¯\_(ツ)_/¯'";

alias _fox_fzf="fzf --height=70% --preview='bat --style=numbers --color=always --line-range :500 {}' --preview-window=right:50%:wrap"
alias _fox_fzfvim="fzf --height=70% --preview='bat --style=numbers --color=always --line-range :500 {}' --preview-window=right:50%:wrap | xargs -o vim"
alias _fox_path="echo \$PATH | tr ':' '\n'"
alias _fox_random="echo ${RANDOM:0:2};"

alias _fox_now="fn_fox_now_date && fn_fox_now_time;"
alias _fox_now_date="fn_fox_now_date;"
alias _fox_now_time="fn_fox_now_time;"

# === === aws

alias _fox_aws="echo '
:: help ::

  _fox_aws_check                                      # use sts to check connectivity
  _fox_aws_config                                     # show aws account configure
  _fox_aws_config_init                                # set up aws account using configuration

  _fox_aws_access_key_id <profile>                    # get aws key id
  _fox_aws_secret_access_key <profile>                # get aws secret access key
  _fox_aws_profile_load <profile>                     # load profile

  _fox_aws_profile_ls                                 # list all profiles

  aws_vault add <profile>                             # add new profile. check ~/.aws/config to verify profile arn
  aws_vault list                                      # list all profiles in aws vault
'"

alias _fox_aws_check="aws sts get-caller-identity"
alias _fox_aws_config="bat ~/.aws/config; bat ~/.aws/credentials;"
alias _fox_aws_config_init="mkdir -pv ~/.aws && aws configure;"
alias _fox_aws_access_key_id="aws configure get aws_access_key_id --profile;"
alias _fox_aws_secret_access_key="aws configure get aws_secret_access_key --profile;"
alias _fox_aws_profile_ls="fn_fox_aws_profile_show;"
alias _fox_aws_profile_load="fn_fox_aws_profile_load;"

fn_fox_aws_profile_show() {
  printf ":: showing aws profile available ::\n\n";
  cat ~/.aws/credentials | grep '\[';
  printf "\n"
  printf ":: showing aws profile loaded ::\n\n";
  aws configure list;
  printf "\n"
}

fn_fox_aws_profile_load() {
  printf ":: loading aws profile(s) : $1 ::\n";
  cat ~/.aws/credentials | grep $1;           # check if user exists in credentials
  export AWS_DEFAULT_PROFILE=$1;
  export AWS_PROFILE=$1;
  export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id --profile $1);
  export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key --profile $1);
  export AWS_DEFAULT_REGION=$(aws configure get region --profile $1);
  aws configure list;
}

# === === docker

alias _fox_docker="echo '
:: help ::

  _fox_docker_ps                                      # list all process
  _fox_docker_ps_less                                 # list all process (fit width)
  _fox_docker_ps_prune                                # purge all processes
  _fox_docker_img                                     # list images
  _fox_docker_img_prune                               # purge all images
  _fox_docker_vol                                     # list all volumes
  _fox_docker_vol_prune                               # purge all volumes
  _fox_docker_network                                 # list all docker networks
  _fox_docker_network_prune                           # purge all docker networks

  _fox_docker_show                                    # show all of docker
  _fox_docker_prune                                   # prune all (purge all containers and images)

  _fox_docker_sh <container id>                       # shell sh into container
  _fox_docker_bash <container id>                     # shell bash into container
  _fox_docker_logs <container id>                     # show docker logs

  _fox_docker_stop <container id>                     # stop container

:: notes ::

  docker build -t mycontainername .
'"

alias _fox_docker_ps="docker ps -a;"
alias _fox_docker_ps_less="docker ps | less -S;"
alias _fox_docker_ps_prune="fn_fox_docker_pspurge;"

alias _fox_docker_img="docker image list"
alias _fox_docker_img_prune="fn_fox_docker_imgpurge;"

alias _fox_docker_vol="docker volume ls"
alias _fox_docker_vol_prune="docker volume prune"

alias _fox_docker_network="docker network ls"
alias _fox_docker_network_prune="docker network prune"

alias _fox_docker_show="echo '=== PS ===';docker ps -a;echo '=== IMAGES ===';docker image list;echo '=== VOLUMES ==='; docker volume ls;echo '=== NETWORKS ==='; docker network list;"
alias _fox_docker_prune="docker system prune"

alias _fox_docker_logs="docker logs"
alias _fox_docker_sh="fn_fox_docker_sh"
alias _fox_docker_bash="fn_fox_docker_bash"

alias _fox_docker_stop="fn_fox_docker_stop"

fn_fox_docker_pspurge() {
  printf ":: stopping and removing docker containers :: \n";
  docker stop $(docker ps -a -q);
  docker rm $(docker ps -a -q);
}

fn_fox_docker_imgpurge(){
  printf ":: purging unused images :: \n";
  # docker rmi $(docker images --filter "dangling=true" -q --no-trunc);
  docker rmi $(docker images -a -q);
}

fn_fox_docker_volpurge(){
  printf ":: purging all volumes :: \n";
  docker volume prune;
}

fn_fox_docker_sh() {
  printf ":: sh into container ::\n";
  docker exec -it $1 sh;
}

fn_fox_docker_bash() {
  printf ":: (ba)sh into container ::\n";
  docker exec -it $1 bash;
}

fn_fox_docker_stop() {
  printf ":: stop and remove container ::\n";
  docker stop $1; docker rm $1;
}

# === === file

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

  _fox_file_compress <tarfile.tar.gz> <path/to/file/or/dir>
  _fox_file_extract <tarfile.tar.gz> <path/to/file/or/dir>

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

alias _fox_file_compress="tar -czvf"
alias _fox_file_extract="tar -xzvf"

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

# === === git

alias _fox_git="echo '
:: help ::

  _git_config                   # show git config
  _git_show                     # fetch + show branch + show stash
  _git_diff                     # show difference between current and HEAD

  _git_ls                       # fetch and list all branches
  _git_ll                       # show log in pretty format

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

alias _git_config="echo ':: showing gitconfig ::'; bat ~/.gitconfig;"
alias _git_show="git fetch --all --prune; printf '\n'; git branch --all -vv; printf '\n'; git status --show-stash -vv;"
alias _git_diff="echo ':: git changes - git diff head^ ::'; git diff head^;"

alias _git_ls="git fetch --all; git branch --all;"
alias _git_ll="git log --pretty='format:%C(yellow)%h%Creset - %Cgreen%>(12)%ad%Creset %C(bold blue)<%an>%Creset %s' --date=relative;"

# === === sys ops

alias _fox_sys="echo '
:: help ::

  _fox_sys_ls                                         # show general system information + listening ports + processes
  _fox_sys_ps                                         # show running processes

  _fox_sys_ip                                         # show ip of en0
  _fox_sys_network                                    # show all network information
  _fox_sys_ports                                      # investigate listing ports
  _fox_sys_subnet                                     # show subnet for a range _subnet subnet.im/192.168.12.12/30
  _fox_sys_tcp                                        # show tcp dump

:: notes ::

  ifconfig -a | grep ether                            # get mac address
  ifconfig | grep inet                                # get inet

  dig @8.8.8.8 yahoo.com                              # check ip v4/zone records for yahoo.com
  nslookup www.mytestsite.com                         # check dns zone resolving/ipv4 for www.mytestsite.com
  host yahoo.com                                      # check ip v4/v6 and dns records
'"

alias _fox_sys_ls="fn_fox_system;fn_fox_showmaclaunch;"
alias _fox_sys_ps="ps -a;"

alias _fox_sys_ip="ifconfig en0 | grep inet;"
alias _fox_sys_network="fn_fox_network_info;"
alias _fox_sys_port="printf 'sudo lsof -PiTCP -sTCP:LISTEN;"
alias _fox_sys_subnet="echo 'use curl subnet.im/192.168.12.12/30'"
alias _fox_sys_tcp="tcpdump -D;"

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
# === mini tools
# ===

# === === ascii graph tool

_fox_graph_ascii () {
  if [ -z "$1" ]; then
    cat << EOM

:: usage ::

  _fox_graph_ascii <file>
  _fox_graph_ascii sample.dot

  # sample.dot
  digraph test {
    a -> b -> c;
    b -> d;
  }

  _fox_graph        # for more examples

EOM
  else
    cat $1 | docker run -i tsub/graph-easy;
  fi
}


# ===
# === hints
# ===

# === === ansible

_fox_ansible () { cat <<-EOF

:: help ::

  ansible -m setup <hostname>                                 # show all ansible variables for host
  ansible -m setup localhost                                  # show all ansible variables for localhost

  {{ lookup('env','HOME') }}                                  # read environment variable
  {{ lookup('file', '/etc/foo.txt') }}                        # read file contents

EOF
}

# === === awk

_fox_awk () { cat <<-EOF

:: help ::

  awk '{ print \$1 }'                                        # print first col
  awk '{ printf \$0 " " }' test.txt                          # prints a multiline file as single line with space as delimiter

EOF
}

# === === bash

_fox_bash () { cat <<-EOF

:: help ::

  ls                            # list condensed
  ll                            # list with permissions
  lt                            # list tree

  _rs                           # reload current shell

  _cp                           # cp with confirmation
  _mv                           # mv with confirmation
  _rm                           # rm with confirmation

:: notes ::

  > file                        # redirects stdout to file
  1> file                       # redirects stdout to file
  2> file                       # redirects stderr to file
  &> file                       # redirects stdout and stderr to file
  2&1> file                     # redirects stdout and stderr to file

  /dev/null                     # null device

  \$(date +"%Y%m%d-%H:%M:%S")      # current date and time
  \$(date +"%Y%m%d")               # current date
  \$(date +"%H:%M:%S")             # current time
  \$(date +"%s")                   # epoch seconds after 1970

  # basic permissions
  0: no rights / 1: execute / 2: write / 4: read

  # combination of basic permissions
  3: write + execute / 5: read + execute / 6: read + write / 7: read + write + execute

  # common structure of permissions (i.e. chmod 754)
  7 (1st no.) user permission
  5 (2nd no.) group permission
  4 (3rd no.) others permission

  # http request status codes
  - 1xx (info)
  - 2xx (success) - 200 (ok)
  - 3xx (redirection)
  - 4xx (client side) - 404 (not found) - 403 (forbidden)
  - 5xx (server side) - 503 (service unavailable) - 504 (gateway timeout)

EOF
}

# === === crontab

_fox_cron () { cat <<-EOF

:: help ::

  crontab -l                                                  # show crontab for current user
  crontab -e                                                  # edit crontab for current user
  crontab -r                                                  # remove crontab for current user
  crontab -r -i                                               # remove crontab with confirmation for current user

  crontab -l > file                                           # load crontab to file
  crontab file                                                # load crontab from file

  (crontab -l ; echo '0 4 * * * myscript') | crontab -        # load crontab directly

  # crontab script for crontab
  @reboot /home/user/script.sh                                # run script at reboot
  * * * * * /home/user/script.sh                              # run script every minute

EOF
}

# === === disk util

_fox_diskutil () { cat <<-EOF

:: help ::

  # show current mounted disks
  diskutil list

  # format the list to get back full size (ensure you get the disk mount i.e. /dev/disk3)
  # useful when SD cards are formatted wrongly i.e. by raspberry pi
  sudo diskutil eraseDisk FAT32 MYSDCARD MBRFormat /dev/disk3

EOF
}

# === === graph

_fox_graph () { cat <<-EOF

:: help ::

  # example run using graph-easy

  docker run -i tsub/graph-easy << EOM
  digraph parent {

    lt [label="Laptop"]
    ti [label="The\nInternet"]

    lt -> ti

    subgraph child {
      lt -> ti
    }
  EOM
  }

EOF
}

# === === kubernetes

_fox_k8s () { cat <<-EOF

:: help ::

  # to launch new credentials
  rm ~/.kube/config;
  az aks get-credentials --subscription <subid> --name <clustername> -g <rgname>; # azure
  aws eks --region <region-code> update-kubeconfig --name <cluster_name>;         # aws

  kubectl                                                     # show all commands
  kubectl version -o json                                     # show version of client and server
  kubectl config view                                         # show all configuration
  kubectl config get-contexts                                 # show available configuration
  kubectl config current-context                              # show current configuration
  kubectl cluster-info                                        # show cluster info

  kubectl api-resources --namespaced=true                     # show all resources (kind/shortnames/etc)

  kubectl get namespaces                                      # show all namespaces (or get ns)

  kubectl get pods --all-namespaces                           # show pods from all namespaces
  kubectl get pods --namespace <namespace>                    # show pods from a namespace
  kubectl describe pods --namespace <namespace> <pod>         # show info of pod from a namespace

  kubectl get events --all-namespaces                         # show events from all namespaces
  kubectl get events --namespace <namespace>                  # show events from a namespace
  kubectl describe events --namespace <namespace> <event>     # show info of pod from a namespace

  kubectl get rs --namespace <namespace>                      # show running replica-sets from a namespace
  kubectl describe rs --namespace <namespace> <replica>       # show details of replica-set from a namespace

  kubectl get <resource> --all-namespaces                     # show info for <resource>: services / pods / pv / configmap / secrets

  kubectl edit svc/docker-registry                            # edit resource
  kubectl logs --namespace <namespace> <pod>                  # view logs of pod
  kubectl delete --namespace <namespace> pod,service foo      # delete pod and services named foo
  kubectl exec <pod> -- ls /                                  # run command on pod (1 container)
  kubectl exec <pod> -c mycontainer -- ls /                   # run command on pod (multi container)

  kubectl apply -f ./my-manifest.yaml                         # create resource(s)
  kubectl apply -f https://git.io/openk8sresources            # create resource(s) from url
  kubectl create deployment nginx --image=nginx               # start a single instance of nginx
  kubectl create -n istio-system secret tls tls-my-domain.com --key=my.domain.com.key --cert=my.domain.com.crt
  # create resource (secret) in namespace (istio-system) with cert and key

  kubectl get configmap -n <namespace>                        # show the list of configmaps deployed for the namespace
  kubectl get configmap -n <namespace> -o yaml <service>      # show the configmap

  kubectx                                                     # for changing context
  kubens                                                      # for changing namespace

  # inspect logs for a pod
  kubectl get pods
  kubectl logs -p <pod> -c <container>

  # ssh into a pod / container
  kubectl get pods
  kubectl exec -it <podname> /bin/bash                        # shell to running container (single) stdin and tty are same as -it
  kubectl exec --stdin --tty <podname> /bin/bash              # shell to running container (single) stdin and tty are same as -it
  kubectl exec -it my-pod --container main-app -- /bin/bash   # shell to running container (multi)

:: notes ::

  https://kubernetes.io/docs/reference/kubectl/cheatsheet/

EOF
}

# === === ssh ssl openssl

_fox_ssh () { cat <<-EOF

:: help ::

  # load default key pair ~/.ssh/id_rsa to ssh agent
  ssh-add;

  # ssh tunnel using ssh -L <local.port>:<target>:<target.port> <proxy>         # consider using stunnel tool - https://www.stunnel.org/auth.html
  ssh -L 8080:www.google.com:80 172.10.10.10

  # generate key pair ~/.ssh/id_rsa_standard (2048 bits)
  ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa_standard -C "( \$HOSTNAME : changeme@gmail.com )"

  # generate random shared secret
  openssl rand -hex 16;

EOF
}

# === === tmux

_fox_tmux () { cat <<-EOF

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

EOF
}

# === === vim

_fox_vim () { cat <<-EOF

:: help ::

  hjkl                                                        # left - down - up - right

  :%s/<search>/<replace>/g                                    # search replace all
  :%s/<search>/<replace>/gc                                   # search replace all with confirmation

EOF
}

# ===
# === dot fox end
# ===
