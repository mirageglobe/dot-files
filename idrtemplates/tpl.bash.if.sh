# compare : -eq equals(num) / -lt less than(num) / -gt greater than(num) / == equals / != not equals / && and / || or
# check : -e file exist / -d dir exist / -r read perm / -w write perm / -x execute perm / ! true if not
if [[ -e myfile.txt ]] ; then
  # do something
elif [[ STRING == STRING ]] ; then
  # do something
else
  # do something
fi
