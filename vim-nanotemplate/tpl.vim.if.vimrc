" conditional - if empty string

if &filetype=='tex' && ( &filetype=='vim' || &filetype=='ruby' )
  set spell
  " do something
elseif &filetype=='python'
  " do something
else
  " do something
endif

