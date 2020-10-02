#!/usr/bin/env bash

# === usage
# chmod +x test.sh
# bash test.sh

# === bash helper functions
# source - https://github.com/mirageglobe/
# version 0.0.2

function fn_check_file_regex {
  # args: string regex
	cat $(1) || grep "$(2)"
}

function fn_check_command_note {
  # args: string error
	command -V $(1) || printf "$(2)"
}

function fn_print_header {
  # args: string
	echo "";
	echo "=== $(1)";
	echo "";
}

# === end bash helper functions

# === main

fn_print_header "bash script"
