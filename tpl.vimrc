" === use ===
"
" add/replace this file as ~/.vimrc or $HOME/.vimrc

if filereadable(expand("~/dot-files/dot.vimrc"))
  source ~/dot-files/dot.vimrc
endif

if filereadable(expand("~/dot-files/dot.idr.vimrc"))
  source ~/dot-files/dot.idr.vimrc
endif
