# #!/usr/bin/env bash

# good references can be found:
# - https://devhints.io/bash

# recommended use

# === basic commands ===

# == variable contants
#
# CONST_VAR="variable"

# == print
#
# printf "this is a value : \t %s \n", "test_value";
# echo "this is another echo value";
# echo "location is $(pwd)";
# echo "location can be this `pwd` too";

# == arrays
# FARRAY=('val1' 'val2' 'val3')
# 
# FARRAY[0]="val1"
# FARRAY[1]="val2"
# FARRAY[2]="val3"
# echo ${#FARRAY[@]} # get number of elements

# == if conditionals

# conditional - if empty string
#
# if [[ -z STRING ]]; then
# fi

# conditional - if equals string
#
# if [[ STRING == STRING ]]; then
# fi

# conditional - if not equals string
#
# if [[ STRING != STRING ]]; then
# fi

# case switch
#
# case "$1" in
#   start | up)
#     vagrant up
#     ;;
#   *)
#     echo "Usage: $0 {start|stop|ssh}"
#     ;;
# esac

# == loops while
# while true; do
#   ···
# done

# == for each item loop
# for i in /etc/rc.*; do
#   echo $i
# done

# == function
# get_value() {
#   echo "value $1"
# }
#
# echo "You are $(get_value test)"

# == class
# bash scripting only has functions

# === helper commands ===

# == regular expressions
#
# [[ STRING =~ STRING ]]
# example if [[ "A" =~ "." ]]

# == type conversions
#

# == string functions
#

# == numeric functions
#

# == ranges short cut
#

# == array exists in

# checks if element "$1" is in array "$2"
# @note: be sure that array is passed in the form:
#       "${ARR[@]}"
exists_in () {
  # shopt -s nocasematch # Can be useful to disable case-matching
  local e
  for e in "${@:2}"; do [[ "$e" == "$1" ]] && return 0; done
  return 1
}

# usage:
# list=(11 22 33)
# item=22
#
# if elementIn "$item" "${list[@]}"; then
#     echo TRUE;
# else
#     echo FALSE
# fi


# == os checking script

# fn_jmgl_osdetect() {
#   # sets env variable OSTYPESIMPLE
#   # check os
#   export OSTYPESIMPLE=null;

#   if [[ "$OSTYPE" == "linux-gnu" ]]; then
#     # linux
#     export OSTYPESIMPLE=linux;
#     exit 0;
#   elif [[ "$OSTYPE" == "darwin"* ]]; then
#     printf "%s\\n" "test marker"
#     # mac darwin OSX
#     export OSTYPESIMPLE=osx;
#   elif [[ "$OSTYPE" == "cygwin" ]]; then
#     # posix compatibility layer and linux environment emulation for windows
#     export OSTYPESIMPLE=linux;
#     exit 0;
#   elif [[ "$OSTYPE" == "msys" ]]; then
#     # lightweight shell and gnu utilities compiled for windows (part of mingw)
#     export OSTYPESIMPLE=linux;
#     exit 0;
#   elif [[ "$OSTYPE" == "win32" ]]; then
#     # not sure this can happen
#     export OSTYPESIMPLE=null;
#     exit 0;
#   elif [[ "$OSTYPE" == "freebsd"* ]]; then
#     # freebsd
#     export OSTYPESIMPLE=freebsd;
#     exit 0;
#   else
#     # unknown OS
#     export OSTYPESIMPLE=null;
#     exit 0;
#   fi
# }

