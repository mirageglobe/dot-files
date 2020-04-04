function! s:Initialize(cmd, args) abort
  " my#Init()   # for function namespacing
  " s:          prefix for local script only functions
  " abort       (optional) aborts when an error occurs
  " a:          prefix for arguments
  
  echo "command: " . a:cmd
  " => command: ...
  
  echo a:0
  " => 2
  
  echo a:1
  " => hello

  echo a:2
  " => world
  
  return true
endfunction

call s:Initialize("hello", "world")
echo "Result" . s:Initialize()
