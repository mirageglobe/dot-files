" === usage
"
" add/replace following lines to file as ~/.vimrc or $HOME/.vimrc

if filereadable(expand("~/dot-files/dot.vimrc"))
  source ~/dot-files/dot.vimrc
endif

if filereadable(expand("~/dot-case/dot.idr.vimrc"))
  source ~/dot-case/dot.idr.vimrc
endif
