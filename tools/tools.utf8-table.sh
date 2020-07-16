#!/usr/bin/env bash

printf ":: use bash and not sh :: \n"

printf "0 1 2 3 4 5 6 7 8 9 a b c d e f \n"

echo -e "\ue3c4"

printf "\\ue3c4 \n"

echo "- code is $1"
echo -e "\u$1"

# in utf-8 it's actually 6 digits (or 3 bytes)
printf '\xE2\x98\xA0'

# to check how its encoded
printf ☠ | hexdump

# -e is not posix; use \033 instead
# printf '\033[3;12r\033[3H'

# for y in $(seq 0 524287)
#   do
#   for x in $(seq 0 7)
#   do
#     a=$(expr $y \* 8 + $x)
#     echo -ne "$a \\u$a "
#   done
#   echo
# done
