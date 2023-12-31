
" # ============================================================== info ===== #
" ~/.vimrc

" # --------------------------------------------------------- reference ----- #

" <https://superuser.com/questions/1425920/different-between-set-g-and-setw-g-and-set>

" # ------------------------------------------------------------- setup ----- #

" add/replace following lines to file as ~/.vimrc or $HOME/.vimrc

" or copy this file to home folder
" # cp -i dot.vimrc ~/.vimrc

" # -------------------------------------------------------------- main ----- #

if filereadable(expand("~/dot-files/dot.vimrc"))
  source ~/dot-files/dot.vim.config.vimrc
endif

" to include vim plugin idr(i dont remember), for example if installed in
" dot-case folder, uncomment the following:
" if filereadable(expand("~/dot-case/idr/dot.idr.vimrc"))
"   source ~/dot-case/idr/dot.idr.vimrc
" endif
