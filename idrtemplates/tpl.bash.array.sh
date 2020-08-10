FARRAY=('val1' 'val2' 'val3')

FARRAY[0]="val1"
FARRAY[1]="val2"

# get number of elements
echo ${#FARRAY[@]} 

# list - usage
list=(11 22 33)
item=22

if elementIn "$item" "${list[@]}"; then
  echo TRUE;
else
  echo FALSE
fi
