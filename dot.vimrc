" ===
" === custom vim config
" ===

" === notes
" - https://tbaggery.com/2011/08/08/effortless-ctags-with-git.html
" - https://vimways.org/2018/you-should-be-using-tags-in-vim/

" === fonts configuration (iterm)
" font -> FuraCode Nerd Font [Regular] [12]
" use built-in Powerline glyphs -> true
" enable subpixel anti-aliasing -> true
" use ligatures -> true
" anti-aliased -> true

" === setting start

" optimisations

set lazyredraw                                        " do not redraw when executing macros; buffer instead of constant redraws
set noshowmode                                        " speed up by turning off showing mode on last line
" set showmode                                         " show current mode down the bottom
set regexpengine=1                                    " speed up by using old regex engine

" general
set nocompatible                                      " required by vim for extra features
set showcmd                                           " noshowcmd / showcmd speed up turning off display of cmds. need to be after nocompatible
set history=1000                                      " number of commands history to store
set visualbell                                        " no sounds
set hidden                                            " set current buffer to be hidden when opening a new file. use :ls to see all buffers then :b[n] n=buffer number to select

set backupcopy=yes                                    " yes/no/auto when opening a file, vim makes a copy and overwrites
set undodir=~/.vim/.undo//                            " set vim to use tmp directory for undo files
set backupdir=~/.vim/.backup//                        " set vim to use tmp directory for backup files
set directory=~/.vim/.swp//                           " set vim to use tmp directory for swp files

set encoding=UTF-8                                    " The encoding displayed.
set fileencoding=UTF-8                                " The encoding written to file

" colour
" if gui (macvim) or not gui (iterm/alacritty)
if has('gui_running')
  set guifont=FiraCode\ Nerd\ Font\ Complete:h13
  " set guifont=Inconsolata\ Nerd\ Font\ Complete:h13
else
  set t_Co=256
endif

if (has("termguicolors"))
  set termguicolors
endif

" clipboard
" - will not work if its -clipboard (not complied with vim)
" - * and + is the same for macosx and windows
" - https://vim.fandom.com/wiki/Accessing_the_system_clipboard
" - https://stackoverflow.com/questions/677986/vim-copy-selection-to-os-x-clipboard

if has("clipboard")
  set clipboard=unnamed         " copy to the system clipboard
  if has("unnamedplus")         " X11 support
    set clipboard+=unnamedplus
  endif
endif

" === code

" === === completion

filetype indent plugin on                             " enables filetype - plugins, indenting rules, syntax highlighting http://vimdoc.sourceforge.net/htmldoc/filetype.html
set omnifunc=syntaxcomplete#Complete                  " turn on omnicomplete
set completeopt+=longest,menuone                      " mandatory setting for vim
" set path+=**                                          " provides tab completion for all file related tasks

" === === highlight

syntax on                                             " set syntax highlighting in vim
set list listchars=tab:»·,trail:·                     " display tabs and trailing spaces visually

" === === numbering
set number                                            " show line numbers
set relativenumber                                    " enables relative number rather than running number

" === === folding
" <leader>z for fold

set nofoldenable
set foldmethod=indent
set foldnestmax=10
set foldlevel=2

" === === indentation

set smartindent
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" === === wrapping

set wrap linebreak nolist                             " set soft wrap for text
" set nowrap                                            " turn off code wrap

" === command

set wildmenu                                          " display command line completion, use :b to find files, :ls for list buffer
set wildmode=list:full                                " display all command options of wildmenu with double tab

" mouse cursor and scrolling

set mouse=a                                           " turn on terminal mouse
set cursorline                                        " highlight current line
set scrolloff=5                                       " setting window to scroll when x lines at end of screen
set timeoutlen=1000                                   " speed up scrolling
set ttimeoutlen=0                                     " speed up scrolling
set ttyfast                                           " speed up loading and scrolling of vim (boolean)
set ttyscroll=10                                      " set scrolling speed (1-999; 1 fastest)

" spell check
" z= activate / zg add word to dict / zw mark incorrect to dict / [s next / ]s prev /

set spell spelllang=en_gb                             " turn on vims spell checker
" set nospell                                           " explicitly turn off spell check

" misc

" set splitright                                        " auto split right for screens

" === setting end

" === plug start

" ==> auto-install vim-plug

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" ==> colour schemes and IDE customisation

Plug 'drewtempelmeyer/palenight.vim'                  " enables palenight color scheme
Plug 'itchyny/lightline.vim'                          " enables superlight status bar - https://github.com/itchyny/lightline.vim
Plug 'itchyny/vim-gitbranch'                          " simple gitbranch name to replace fugitive
Plug 'rafi/awesome-vim-colorschemes'                  " enables package colorschemes (rafi)
" Plug 'flazz/vim-colorschemes'                         " enables package colorschemes (flazz)
" Plug 'dracula/vim'                                    " enables gruvbox colorscheme
" Plug 'lifepillar/vim-gruvbox8'                        " enables gruvbox colorscheme
" Plug 'lifepillar/vim-solarized8'                      " enables gruvbox colorscheme

Plug 'editorconfig/editorconfig-vim'                  " enables .editorconfig file overrides - https://editorconfig.org/
Plug 'tpope/vim-sensible'                             " enables common standard settings for vim

Plug 'tpope/vim-commentary'                           " enables commenting - gcc (to [un]comment line) - gc(to comment with motion)
Plug 'mhinz/vim-startify'                             " enables fancy startup
" Plug 'tpope/vim-surround'                             " enables quoting with cs[' to change quotes from [ to ' - cst to add quotes
Plug 'tpope/vim-repeat'                               " enables repeating command or input with "."

" ==> file management

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }   " installs fzf
Plug 'junegunn/fzf.vim'                               " enables super fast fuzzy search with :FZF
" Plug 'tpope/vim-vinegar'                              " enables file drawer with - key
Plug 'airblade/vim-gitgutter'                         " shows git status in gutter
" Plug 'tpope/vim-fugitive'                             " run git commands in vim
" Plug tpope/vim-rhubarb
" Plug 'tommcdo/vim-fubitive'                           " git in vim for bitbucket
Plug 'jlanzarotta/bufexplorer'                        " buffer explorer

" ==> language / syntax

Plug 'majutsushi/tagbar'                              " enables ctag sidebar (install ctag via brew)
Plug 'ludovicchabant/vim-gutentags'                   " auto ctag management
" Plug 'lifepillar/vim-mucomplete'                      " enables code completion popup
Plug 'neoclide/coc.nvim', {'branch': 'release'}       " enables code completion
Plug 'sheerun/vim-polyglot'                           " syntax superfast on demand loader for over 100 languages
" Plug 'ervandew/supertab'                              " enables tab actions i.e. autocomplete by using <tab> insert mode
" Plug 'maralla/completor.vim'                          " yet another async code completion cool
" Plug 'vim-vdebug/vdebug'                              " vim debugger that interfaces with xdebug
" Plug 'MarcWeber/vim-addon-mw-utils'                   " snippet tool 
" Plug 'tomtom/tlib_vim'                                " snippet tool
" Plug 'garbas/vim-snipmate'                            " snippet tool
" Plug 'honza/vim-snippets'                             " snippets - optional

" Plug 'hashivim/vim-terraform'                         " enable syntax for hashicorp
" Plug 'hashivim/vim-consul'                            " enable syntax for hashicorp
" Plug 'hashivim/vim-vagrant'                           " enable syntax for hashicorp
" Plug 'hashivim/vim-nomadproject'                      " enable syntax for hashicorp
" Plug 'hashivim/vim-packer'                            " enable syntax for hashicorp
" Plug 'posva/vim-vue'                                  " enable syntax for vue

" Plug 'groenewege/vim-less'
" Plug 'vim-ruby/vim-ruby'
" Plug 'tpope/vim-rails'
" Plug 'tpope/vim-markdown'
" Plug 'pangloss/vim-javascript'

" ==> linters

Plug 'dense-analysis/ale'                             " enables ale universal language linter
Plug 'maximbaz/lightline-ale'                         " enables ale in lightline
" Plug 'scrooloose/syntastic'

" ==> misc

" must be at the end
Plug 'ryanoasis/vim-devicons'                         " enables super fonts (nerd fonts for vim)

call plug#end()

" === plug end

" === colorscheme start
" to select, :colorscheme then space followed by tab

set background=dark

" ==> solarized options
"
" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"

" colorscheme gruvbox
" colorscheme gruvbox8_hard
" colorscheme gruvbox8_soft
" colorscheme gruvbox8
" colorscheme dracula
" colorscheme lucius
" colorscheme nord
" colorscheme OceanicNext
" colorscheme PaperColor
colorscheme palenight
" colorscheme solarized
" colorscheme solarized8
" colorscheme tender
" colorscheme zenburn

" === colorscheme end

" === lightline start

" scriptencoding utf-8                                " (optional) unknown setting
set laststatus=2                                      " (optional) fix for statusline not showing
set noshowmode                                        " hide status of mode (insert/visual) as lightline is showing

" lightline init - needs to be first function

let g:lightline = {
      \   'separator': { 
      \     'left': "",
      \     'right': "",
      \   },
      \   'subseparator': { 
      \     'left': "\ue0b1",
      \     'right': "\ue0b3",
      \   }
      \ }

" colorscheme for lightline
"   powerline, wombat, jellybeans, solarized dark, solarized light,
"   PaperColor dark, PaperColor light, seoul256, one dark, one light, landscape
let g:lightline.colorscheme = 'wombat'

let g:lightline.component = {
      \   'gitbranch': ' %{gitbranch#name()}',
      \   'lineinfo': ' %3l:%-2v',
      \   'filetype': '%{&filetype}',
      \   'readonly': '%{&filetype=="help"?"":&readonly?"":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \ }
      " \     'fugitive': '%{exists("*fugitive#head")?"":""} %{exists("*fugitive#head")?fugitive#head():""}',

" let g:lightline.component_function = {
"       \   'gitbranch': 'gitbranch#name'
"       \ }

let g:lightline.component_visible_condition = {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \ }
      " \     'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())',

" lightline active
let g:lightline.active = {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'gitbranch', 'readonly', 'filename', 'modified' ],
      \     [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]
      \   ]
      \ }


" === === lightline ale

let g:lightline.component_expand = {
      \   'linter_checking': 'lightline#ale#checking',
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \   'linter_checking': 'left',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'left',
      \ }

" change lightline ale plugin to use symbols
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"

" === === lightline ale end

" === lightline end

" === ale start

" Enable completion where available.
" This setting must be set before ALE is loaded.
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

" example - for vue files .. run vue and javascript linters
let g:ale_linter_aliases = {
      \   'vue': ['vue', 'javascript'],
      \   'erb': ['erb', 'html'],
      \ }
let g:ale_linters = {
      \   'javascript': ['standard'],
      \   'vue': ['vls'],
      \ }
let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'javascript': ['prettier'],
      \ }

" show 5 lines of errors (default: 10)
let g:ale_list_window_size = 5

" === ale end

" === fugitive start

" set statusline+=%{fugitive#statusline()}

" === fugitive end

" === mucomplete start

" set shortmess+=c                                      " shut off completion messages
" let g:mucomplete#enable_auto_at_startup = 1           " auto startup mucomplete
" let g:mucomplete#completion_delay = 1                 " makes mucomplete less interuptive by only activating on pause
" imap <expr> <down> mucomplete#extend_fwd("\<down>")   " expanding via context see mucomplete-extend-compl

" === mucomplete end

" === vim polyglot start

" setting polygot terraform-vim
let g:terraform_fmt_on_save=1

" === vim polyglot end

" === supertab start

" let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabContextDefaultCompletionType = "<c-n>"

" === supertab end

" === syntastic start

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" let g:syntastic_javascript_checkers = ['standard']

" allow the use of 'local'
" let g:syntastic_sh_shellcheck_args="-e SC2039"

" === syntastic end

" === vim vinegar start
" gh  - toggle hidden files
" -   - toggle project drawer
" .   - using on a file to populate in command view
" y.  - to yank absolute path for file cursor
" ~   - to go home

" activate default treeview for terminal
" let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'      " hide dot files - press gh
" to toggle hiding

let g:netrw_liststyle = 3                             " use tree view
let g:netrw_altv = 1
" let g:netrw_banner = 0                               " remove top banner
" let g:netrw_browse_split = 4                         " open a new horizonal split for file
" let g:netrw_winsize = 25                             " set width of tree to 25%

"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

" === vim vinegar end

" === commands start

command ReloadShell :source ~/dot-files/dot.vimrc

" fzf - overrides Files command - usage :Files!
command! -bang -nargs=* -complete=dir Files
      \ call fzf#vim#files(<q-args>,
      \   <bang>0 ? fzf#vim#with_preview('up:100%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

" === commands end

" === aliases start
"
" ref - http://learnvimscriptthehardway.stevelosh.com/chapters/08.html
" ref - http://learnvimscriptthehardway.stevelosh.com/chapters/03.html

" i = insert / c = command / v = visual / n = normal
" map = single key map / abbrev = statment map (alias)
" note : do not use comments AFTER the cabbrev line as it reads in as command

" split vertical and launch terminal
" cabbrev termv vertical terminal

" split horizontal (default) and launch terminal
" cabbrev termh terminal

" === aliases end

" === mapping start

" n = normal mode

" map       normal and visual mode (defaults to remap)
" nmap      normal mode
" vmap      visual mode
" imap      insert mode

" remap     map recursively (default)
" noremap   non recursive map

" <c-d>   control + d

" ref - https://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping

" maps base leader key from , to space
let mapleader = "\<space>"

" === key maps

" === === open file explorer
nnoremap <Leader><SPACE> :Explore<CR>

" === === open file explorer
" nnoremap <Leader>w <C-w><C-w>

" === === open tagbar - ctag explorer
nnoremap <Leader>ct :TagbarToggle<CR>

" === === set git co-author
" let @z='ICo-authored-by: y$A <@gmail.com>@Pgua<f x'
" nmap <Leader>@ <ESC>VD <ESC>ICo-authored-by: <CR>
nmap <Leader>jd <ESC>ICo-authored-by: John Doe <johndoe@gmail.com><ESC>

" yank to/from clipboard
vnoremap <Leader>y :w !pbcopy<CR><ESC>
nnoremap <Leader>p :r !pbpaste<CR><ESC>

" code folding za / zc / zo
nmap <Leader>z za<ESC>

" split navigations
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

" nmap <Leader> a# ===<ESC>Vgcc<ESC>^f=;;<esc>a<space>

" read an empty template into current buffer based on filetype
" nnoremap <Leader>c :-1read ~/dot-files/vim-nanotemplate/template.c.c<CR>
" nnoremap <Leader>php :-1read ~/dot-files/vim-nanotemplate/template.php.php<CR>
" nnoremap <Leader>tf :-1read ~/dot-files/vim-nanotemplate/template.terraform.tf<CR>

" note that this remap uses gcc : timpopes auto commenter. method to
" append ===, comment this, move cursor to first marker, append mode

" nmap <Leader>hh a#<SPACE>===<CR>#<SPACE>===<SPACE><CR>#<SPACE>===<ESC>Vkkgcc<ESC>j^f=;;<ESC>a<SPACE><ESC>
" nmap <Leader>hj a# ===<ESC>Vgcc<ESC>^f=;;<esc>a<space><ESC>
" nmap <Leader>hk a## ==><ESC>Vgcc<ESC>^f=ll<esc>a<space><ESC>
" nmap <Leader>hl a### >=><ESC>Vgcc<ESC>^f=ll<esc>a<space><ESC>

" filetype specific snippets
" ref - http://vimdoc.sourceforge.net/htmldoc/autocmd.html
" ref - http://learnvimscriptthehardway.stevelosh.com/chapters/13.html#autocommands-and-abbreviations

" if exists("did_load_filetypes")

"   augroup leadershortcut

"     " remove all autocommands for the current group
"     autocmd!

"     " markdown files
"     if index(['markdown'], &filetype) != -1

"       autocmd FileType markdown nnoremap <Leader>h 0i# <ESC>$<ESC>
"       autocmd FileType markdown nnoremap <Leader>hh 0i## <ESC>$<ESC>
"       autocmd FileType markdown nnoremap <Leader>hhh 0i### <ESC>$<ESC>
"       autocmd FileType markdown nnoremap <Leader>hr o---<ESC>
"       autocmd FileType markdown nnoremap <Leader>ref aref - <ESC>$<ESC>
"       autocmd FileType markdown nnoremap <Leader>code a```<ESC>o```<ESC>k<ESC>o# code block<CR><ESC>

"     endif

"   augroup END

"   augroup vimnano

"     " remove all autocommands for the current group
"     autocmd!

"     " html files
"     if index(['html'], &filetype) != -1

"       autocmd FileType vim nnoremap <Leader>hel :-1read ~/dot-files/vim-nanotemplate/tpl.html.html<CR>

"     endif

"     " python files
"     if index(['python'], &filetype) != -1

"       autocmd FileType python nnoremap <Leader>hel :-1read ~/dot-files/vim-nanotemplate/tpl.python.py<CR>
"       autocmd FileType python nnoremap <Leader>arr :-1read ~/dot-files/vim-nanotemplate/tpl.python.arr.py<CR>
"       autocmd FileType python nnoremap <Leader>cla :-1read ~/dot-files/vim-nanotemplate/tpl.python.cla.py<CR>
"       autocmd FileType python nnoremap <Leader>if :-1read ~/dot-files/vim-nanotemplate/tpl.python.if.py<CR>

"     endif
"   augroup END

" endif " exists("did_load_filetypes")

" === mapping end

" === idrtemplates start

" if exists("did_load_filetypes")
"   finish
" endif

  " augroup filetypedetect

command IDR :call IDRtoggle()
command IDRhelp :call IDRhelp()
command IDRif :call IDRif()

function IDRtoggle()
  echom "activate i dont remember (IDR) templates"
endfunction

function IDRhelp()
  if index(['vim'], &filetype) != '-1'                              " vimrc
    -1read ~/dot-files/idrtemplates/tpl.vim.vim
  elseif index(['conf','sh'], &filetype) != '-1'                    " bash sh
    -1read ~/dot-files/idrtemplates/tpl.bash.sh
  endif
endfunction

function IDRif()
  if index(['vim'], &filetype) != '-1'                              " vimrc
    -1read ~/dot-files/idrtemplates/tpl.vim.if.vim
  elseif index(['conf','sh'], &filetype) != '-1'                    " bash sh
    -1read ~/dot-files/idrtemplates/tpl.bash.if.sh
  endif
endfunction

    " vimrc files
    " if index(['vim'], &filetype) != '-1'

    "   command IDRhelp :-1read ~/dot-files/idrtemplates/tpl.vim.vim

    "   command -buffer IDRif :-1read ~/dot-files/idrtemplates/tpl.vim.if.vim
    "   command -buffer IDRvar :-1read ~/dot-files/idrtemplates/tpl.vim.var.vim
    "   command -buffer IDRecho :-1read ~/dot-files/idrtemplates/tpl.vim.echo.vim
    "   command -buffer IDRfunction :-1read ~/dot-files/idrtemplates/tpl.vim.function.vim

    " endif

    " " bash sh files
    " if index(['conf','sh'], &filetype) != -1

    "   command! -buffer IDRhelp :-1read ~/dot-files/idrtemplates/tpl.bash.sh

    "   command! -buffer IDRif :-1read ~/dot-files/idrtemplates/tpl.bash.if.sh
    "   command! -buffer IDRfunction :-1read ~/dot-files/idrtemplates/tpl.bash.function.sh

    " endif

    " " ruby files
    " if index(['ruby'], &filetype) != -1

    "   command! -buffer IDRhelp :-1read ~/dot-files/idrtemplates/tpl.ruby.rb

    "   command! -buffer IDRarray :-1read ~/dot-files/idrtemplates/tpl.ruby.array.rb
    "   command! -buffer IDRclass :-1read ~/dot-files/idrtemplates/tpl.ruby.class.rb
    "   command! -buffer IDRconstant :-1read ~/dot-files/idrtemplates/tpl.ruby.constant.rb
    "   command! -buffer IDRecho :-1read ~/dot-files/idrtemplates/tpl.ruby.echo.rb
    "   command! -buffer IDRfunction :-1read ~/dot-files/idrtemplates/tpl.ruby.function.rb
    "   command! -buffer IDRif :-1read ~/dot-files/idrtemplates/tpl.ruby.if.rb
    "   command! -buffer IDRloop :-1read ~/dot-files/idrtemplates/tpl.ruby.loop.rb
    "   command! -buffer IDRswitch :-1read ~/dot-files/idrtemplates/tpl.ruby.switch.rb
    "   command! -buffer IDRregex :-1read ~/dot-files/idrtemplates/tpl.ruby.regex.rb
    "   command! -buffer IDRvariable :-1read ~/dot-files/idrtemplates/tpl.ruby.variable.rb

    " endif

    " ansible
    " terraform
  " augroup END
" endif

" === idrtemplates end

