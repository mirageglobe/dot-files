" ~/.vimrc 
" add/replace following lines to file as ~/.vimrc or $HOME/.vimrc

if filereadable(expand("~/dot-files/dot.vimrc"))
  source ~/dot-files/dot.vim.config.vimrc
endif
