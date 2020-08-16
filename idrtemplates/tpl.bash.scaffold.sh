
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

# === main
