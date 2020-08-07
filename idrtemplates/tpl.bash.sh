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
exists_in() {
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


# == trim array

##!/bin/bash

## trim function

#trim() {
#  local var
#  var="$*"
#  # remove leading whitespace characters
#  var="${var#"${var%%[![:space:]]*}"}"
#  # remove trailing whitespace characters
#  var="${var%"${var##*[![:space:]]}"}"
#  # echo $var
#}

## array
#arr=( \
#  hello   \  # test
#  world   \
#  world2  \
#)

## trim leading white space
#arr="${arr##*( )}"

## trim trailing white space
#arr="${arr%%*( )}"

## loop array
#for item in ${arr[*]}
#do
#  # item=$(trim $item)        # trim leading trailing whitespace
#  echo $item
#done

# useful bash header functions (include this in header of bash script

# === bash helper functions
# source - https://github.com/mirageglobe/
# version 0.0.1

define fn_check_file_regex
	cat $(1) || grep "$(2)"
endef

define fn_check_command_note
	command -V $(1) || printf "$(2)"
endef

define fn_print_header
	echo "";
	echo "==> $(1)";
	echo "";
endef

define fn_print_header_command
	echo "";
	echo "==> $(1)";
	echo "";
	$(2);
endef

define fn_print_tab
	printf "%s\t\t%s\t\t%s\n" $(1) $(2) $(3)
endef

# === end bash helper functions
