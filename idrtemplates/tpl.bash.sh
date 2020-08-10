
# === references
# - https://devhints.io/bash

# == variable constants
#
# CONST_VAR="variable"

# === helper commands ===

# == array exists in
# checks if element "$1" is in array "$2"
# @note: be sure that array is passed in the form: "${ARR[@]}"

exists_in() {
  # shopt -s nocasematch # Can be useful to disable case-matching
  local e
  for e in "${@:2}"; do [[ "$e" == "$1" ]] && return 0; done
  return 1
}

# == os checking script

fn_detect_os() {
  # sets env variable OSTYPESIMPLE
  # check os
  export OSTYPESIMPLE=null;

  if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # linux
    export OSTYPESIMPLE=linux;
    exit 0;
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    printf "%s\\n" "test marker"
    # mac darwin OSX
    export OSTYPESIMPLE=osx;
  elif [[ "$OSTYPE" == "cygwin" ]]; then
    # posix compatibility layer and linux environment emulation for windows
    export OSTYPESIMPLE=linux;
    exit 0;
  elif [[ "$OSTYPE" == "msys" ]]; then
    # lightweight shell and gnu utilities compiled for windows (part of mingw)
    export OSTYPESIMPLE=linux;
    exit 0;
  elif [[ "$OSTYPE" == "win32" ]]; then
    # not sure this can happen
    export OSTYPESIMPLE=null;
    exit 0;
  elif [[ "$OSTYPE" == "freebsd"* ]]; then
    # freebsd
    export OSTYPESIMPLE=freebsd;
    exit 0;
  else
    # unknown OS
    export OSTYPESIMPLE=null;
    exit 0;
  fi
}

# === trim function

trim() {
  local var
  var="$*"
  # remove leading whitespace characters
  var="${var#"${var%%[![:space:]]*}"}"
  # remove trailing whitespace characters
  var="${var%"${var##*[![:space:]]}"}"
  # echo $var
}

# === array

arr=( \
  hello   \  # test
  world   \
  world2  \
)

# trim leading white space
arr="${arr##*( )}"

# trim trailing white space
arr="${arr%%*( )}"

# loop array
for item in ${arr[*]}
do
  # item=$(trim $item)        # trim leading trailing whitespace
  echo $item
done

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

