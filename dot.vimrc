" ===
" === custom vim config
" ===

" include the following lines in your vimrc file
" cd ~ && touch .vimrc
"
" if filereadable(expand("~/dot.vimrc"))
"   source ~/dot.vimrc
" endif
"
" === iterm2
"
" or nerd fonts and use iterm2 to change font to 
" Font -> FuraCode Nerd Font [Regular] [12]
" Use built-in Powerline glyphs -> true
" Enable subpixel anti-aliasing -> true
" Use ligatures -> true
" Anti-aliased -> true

" === vim start

" ==> system optimisations for vim

set lazyredraw                                        " do not redraw when executing macros; buffer instead of constant redraws
set noshowmode                                        " speed up by turning of showing mode on last line
" set showmode                                         " show current mode down the bottom
set regexpengine=1                                    " speed up by using old regex engine
set scrolloff=5                                       " setting window to scroll when x lines at end of screen
set timeoutlen=1000
set ttimeoutlen=0
set ttyfast                                           " speed up loading and scrolling of vim (boolean)
set ttyscroll=10                                      " set scrolling speed (1-999; 1 fastest)
" set nowrap                                            " speed up by setting nowraping
set wrap linebreak nolist                             " set soft wrap for text

" ==> general

set nocompatible                                      " required by vim for extra features
" set noshowcmd                                         " speed up turning off display of cmds
set showcmd                                           " speed up turning off display of cmds. need to be after nocompatible

set number                                            " show line numbers
set history=1000                                      " store lots of :cmdline history
set visualbell                                        " no sounds
set hidden                                            " set hidden
syntax enable                                         " set syntax highlighting in vim
set backupcopy=yes                                    " yes/no/auto when opening a file, vim makes a copy and overwrites
set undodir=~/.vim/.undo//                            " set vim to use tmp directory for undo files
set backupdir=~/.vim/.backup//                        " set vim to use tmp directory for backup files
set directory=~/.vim/.swp//                           " set vim to use tmp directory for swp files

set encoding=UTF-8                                    " The encoding displayed.
set fileencoding=UTF-8                                " The encoding written to file

" ==> indentation

set smartindent
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" ==> navigation and files

" set path+=**                                          " provides tab completion for all file related tasks
set wildmenu                                          " display all matching files for tab completion, use :b to find files, :ls for list buffer

" ==> visuals

set cursorline                                        " highlight current line

" if running via macvim
if has('gui_running')
  :set guifont=Inconsolata\ Nerd\ Font\ Complete:h13
endif

" if not using any gui. for example iterm2
if !has('gui_running')
  set t_Co=256
endif

if (has("termguicolors"))
  set termguicolors
endif

set splitright                                        " auto split right for screens

" ==> misc settings

" activate mouse for terminal
set mouse=a

" https://vim.fandom.com/wiki/Accessing_the_system_clipboard
" system wide clipboard for macosx : yank to clipboard
" clipboard * and + is the same for macosx and windows
" https://stackoverflow.com/questions/677986/vim-copy-selection-to-os-x-clipboard
" note that this will not work if its -clipboard (not complied with vim)

if has("clipboard")
  set clipboard=unnamed         " copy to the system clipboard
  if has("unnamedplus")         " X11 support
    set clipboard+=unnamedplus
  endif
endif

" highlight trailing space and tabs
set list listchars=tab:»·,trail:·                     " display tabs and trailing spaces visually

" turn on vims omnicomplete
filetype plugin indent on                             " enables filetype detection - http://vimdoc.sourceforge.net/htmldoc/filetype.html
set omnifunc=syntaxcomplete#Complete

" turn on vims spell checker
set spell spelllang=en_gb

set relativenumber                                    " enables relative number rather than running number

" set code folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" === vim end

" === plug start

" ==> auto-install vim-plug

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" ==> colour schemes and IDE customisation

" Plug 'dracula/vim'                                    " enables gruvbox colorscheme
Plug 'drewtempelmeyer/palenight.vim'                  " enables palenight color scheme
" Plug 'flazz/vim-colorschemes'                         " enables package colorschemes (flazz)
Plug 'itchyny/lightline.vim'                          " enables superlight status bar - https://github.com/itchyny/lightline.vim
" Plug 'lifepillar/vim-gruvbox8'                        " enables gruvbox colorscheme
" Plug 'lifepillar/vim-solarized8'                      " enables gruvbox colorscheme
Plug 'rafi/awesome-vim-colorschemes'                  " enables package colorschemes (rafi)

Plug 'editorconfig/editorconfig-vim'                  " enables .editorconfig file overrides - https://editorconfig.org/
Plug 'tpope/vim-sensible'                             " enables common standard settings for vim

Plug 'tpope/vim-commentary'                           " enables commenting - gcc (to [un]comment line) - gc(to comment with motion)
Plug 'mhinz/vim-startify'                             " enables fancy startup
" Plug 'tpope/vim-surround'                             " enables quoting with cs[' to change quotes from [ to ' - cst to add quotes
Plug 'tpope/vim-repeat'                               " enables repeating command or input with "."

" ==> file management

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'                               " enables super fast fuzzy search with :FZF
" Plug 'tpope/vim-vinegar'                              " enables file drawer with - key
Plug 'airblade/vim-gitgutter'                         " shows git status in gutter
Plug 'tpope/vim-fugitive'                             " git in vim
" Plug tpope/vim-rhubarb
" Plug 'tommcdo/vim-fubitive'                           " git in vim for bitbucket

" ==> language / syntax

" Plug 'ervandew/supertab'                              " enables tab actions i.e. autocomplete by using <tab> insert mode
Plug 'lifepillar/vim-mucomplete'                      " enables code completion without tab; similar to supertab
" Plug 'maralla/completor.vim'                          " yet another async code completion cool
Plug 'sheerun/vim-polyglot'                           " syntax superfast on demand loader for over 100 languages
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

Plug 'w0rp/ale'                                       " enables ale universal language linter
Plug 'maximbaz/lightline-ale'                         " enables ale in lightline
" Plug 'scrooloose/syntastic'

" ==> misc

" must be at the end
Plug 'ryanoasis/vim-devicons'                         " enables super fonts (nerd fonts for vim)

call plug#end()

" === plug end

" === vim vinegar start

" activate default treeview for terminal
" let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'      " hide dot files - press gh
" to toggle hiding

let g:netrw_liststyle = 3                             " use tree view
" let g:netrw_banner = 0                               " remove top banner
" let g:netrw_browse_split = 4                         " open a new horizonal split for file
" let g:netrw_winsize = 25                             " set width of tree to 25%
let g:netrw_altv = 1

"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END
"
" notes:
" gh  - toggle hidden files
" -   - toggle project drawer
" .   - using on a file to populate in command view
" y.  - to yank absolute path for file cursor
" ~   - to go home

" === vim vinegar end

" === fugitive start

set statusline+=%{fugitive#statusline()}

" === fugitive end

" === colorscheme start

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

" === lightline start

" scriptencoding utf-8                                " (optional) unknown setting
set laststatus=2                                      " (optional) fix for statusline not showing
set noshowmode                                        " hide status of mode (insert/visual) as lightline is showing

" this is lightlines init; needs to be first function
let g:lightline = {
      \   'component': {
      \     'lineinfo': ' %3l:%-2v',
      \     'filetype': '%{&filetype}',
      \     'readonly': '%{&filetype=="help"?"":&readonly?"":""}',
      \     'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \     'fugitive': '%{exists("*fugitive#head")?"":""} %{exists("*fugitive#head")?fugitive#head():""}',
      \   },
      \   'component_visible_condition': {
      \     'readonly': '(&filetype!="help"&& &readonly)',
      \     'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \     'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())',
      \   },
      \   'separator': { 
      \     'left': "",
      \     'right': "",
      \   },
      \   'subseparator': { 
      \     'left': "\ue0b1",
      \     'right': "\ue0b3",
      \   }
      \ }

" colorscheme for lightline = powerline, wombat, jellybeans, solarized dark, solarized light, PaperColor light, seoul256, one, landscape
let g:lightline.colorscheme = 'palenight'

" load lightline
let g:lightline.active = {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'fugitive', 'readonly', 'filename', 'modified' ],
      \     [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]
      \   ]
      \ }

" ==> lightlineale

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
" let g:lightline#ale#indicator_checking = "\uf110"
" let g:lightline#ale#indicator_warnings = "\uf071"
" let g:lightline#ale#indicator_errors = "\uf05e"
" let g:lightline#ale#indicator_ok = "\uf00c"

" ==> lightlineale end

" === lightline end

" === supertab start

" let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabContextDefaultCompletionType = "<c-n>"

" === supertab end

" === mucomplete start

set completeopt+=menuone                              " mandatory setting for vim
set completeopt+=noselect
set shortmess+=c                                      " shut off completion messages
let g:mucomplete#enable_auto_at_startup = 1           " auto startup mucomplete
" let g:mucomplete#completion_delay = 1                 " makes mucomplete less interuptive by only activating on pause
" imap <expr> <down> mucomplete#extend_fwd("\<down>")   " expanding via context see mucomplete-extend-compl

" === mucomplete end

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

" === the silver searcher start

let g:ackprg = 'ag --nogroup --nocolor --column'

" === the silver searcher end

" === vim polyglot start

" setting polygot terraform-vim
let g:terraform_fmt_on_save=1

" === vim polyglot end

" === aliases and leaderboard shortcuts
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

" === shortcuts start


" === shortcuts end

" === snippets start

" n = normal mode

" map       normal and visual mode
" nmap      normal mode
" vmap      visual mode
" imap      insert mode

" remap     recursive map
" noremap   non recursive map

" <c-d>   control + d

" https://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping

" maps base leader key from , to space
let mapleader = "\<space>"

" general maps
nnoremap <Leader><SPACE> :Explore<CR>

" sets co-authored for github
" let @z='ICo-authored-by: y$A <@gmail.com>@Pgua<f x'
nmap <Leader>@ <ESC>VD <ESC>ICo-authored-by: <CR>
nmap <Leader>jd <ESC>ICo-authored-by: John Doe <johndoe@gmail.com><ESC>

" yank to/from clipboard
vnoremap <Leader>y :w !pbcopy<CR><ESC>
nnoremap <Leader>p :r !pbpaste<CR><ESC>

" code folding za / zc / zo
nmap <Leader>z za<ESC>

" reload
nnoremap <Leader>reload :source ~/dot-files/dot.vimrc<ESC>

" nmap <Leader> a# ===<ESC>Vgcc<ESC>^f=;;<esc>a<space>

" read an empty template into current file - type ,ruby
nnoremap <Leader>c :-1read ~/dot-files/vim-nanotemplate/template.c.c<CR>
nnoremap <Leader>php :-1read ~/dot-files/vim-nanotemplate/template.php.php<CR>
nnoremap <Leader>py :-1read ~/dot-files/vim-nanotemplate/template.python.py<CR>
nnoremap <Leader>tf :-1read ~/dot-files/vim-nanotemplate/template.terraform.tf<CR>

" note that this remap uses gcc : timpopes auto commenter. method to
" append ===, comment this, move cursor to first marker, append mode

nmap <Leader>hh a#<SPACE>===<CR>#<SPACE>===<SPACE><CR>#<SPACE>===<ESC>Vkkgcc<ESC>j^f=;;<ESC>a<SPACE><ESC>
nmap <Leader>hj a# ===<ESC>Vgcc<ESC>^f=;;<esc>a<space><ESC>
nmap <Leader>hk a## ==><ESC>Vgcc<ESC>^f=ll<esc>a<space><ESC>
nmap <Leader>hl a### >=><ESC>Vgcc<ESC>^f=ll<esc>a<space><ESC>

" filetype specific snippets
" ref - http://vimdoc.sourceforge.net/htmldoc/autocmd.html
" ref - http://learnvimscriptthehardway.stevelosh.com/chapters/13.html#autocommands-and-abbreviations

if exists("did_load_filetypes")

  augroup leadershortcut

    autocmd!
    
    " markdown files
    if index(['markdown'], &filetype) == -1

      autocmd FileType markdown nnoremap <Leader>h 0i# <ESC>$<ESC>
      autocmd FileType markdown nnoremap <Leader>hh 0i## <ESC>$<ESC>
      autocmd FileType markdown nnoremap <Leader>hhh 0i### <ESC>$<ESC>
      autocmd FileType markdown nnoremap <Leader>hr o---<ESC>
      autocmd FileType markdown nnoremap <Leader>ref aref - <ESC>$<ESC>
      autocmd FileType markdown nnoremap <Leader>code a```<ESC>o```<ESC>k<ESC>o# code block<CR><ESC>

    endif

  augroup END

  augroup vimnano

    autocmd!

    " bash sh files
    if index(['conf','sh'], &filetype) == -1

      autocmd FileType conf,sh nnoremap <Leader>hel :-1read ~/dot-files/vim-nanotemplate/tpl.bash.sh<CR>
      autocmd FileType conf,sh nnoremap <Leader>if :-1read ~/dot-files/vim-nanotemplate/tpl.bash.if.sh<CR>
      autocmd FileType conf,sh nnoremap <Leader>fun :-1read ~/dot-files/vim-nanotemplate/tpl.bash.fn.sh<CR>

    endif

    " vimrc files
    if index(['vim'], &filetype) == -1

      autocmd FileType vim nnoremap <Leader>var :-1read ~/dot-files/vim-nanotemplate/tpl.vim.var.vimrc<CR>
      autocmd FileType vim nnoremap <Leader>if :-1read ~/dot-files/vim-nanotemplate/tpl.vim.if.vimrc<CR>
      autocmd FileType vim nnoremap <Leader>fun :-1read ~/dot-files/vim-nanotemplate/tpl.vim.fun.vimrc<CR>

    endif

    " html files
    if index(['html'], &filetype) == -1

      autocmd FileType vim nnoremap <Leader>hel :-1read ~/dot-files/vim-nanotemplate/tpl.html.html<CR>

    endif

    " ruby files
    if index(['ruby'], &filetype) == -1

      autocmd FileType ruby nnoremap <Leader>hel :-1read ~/dot-files/vim-nanotemplate/tpl.ruby.rb<CR>
      autocmd FileType ruby nnoremap <Leader>arr :-1read ~/dot-files/vim-nanotemplate/tpl.ruby.arr.rb<CR>
      autocmd FileType ruby nnoremap <Leader>cla :-1read ~/dot-files/vim-nanotemplate/tpl.ruby.cla.rb<CR>
      autocmd FileType ruby nnoremap <Leader>con :-1read ~/dot-files/vim-nanotemplate/tpl.ruby.con.rb<CR>
      autocmd FileType ruby nnoremap <Leader>for :-1read ~/dot-files/vim-nanotemplate/tpl.ruby.for.rb<CR>
      autocmd FileType ruby nnoremap <Leader>fun :-1read ~/dot-files/vim-nanotemplate/tpl.ruby.fun.rb<CR>
      autocmd FileType ruby nnoremap <Leader>if :-1read ~/dot-files/vim-nanotemplate/tpl.ruby.if.rb<CR>
      autocmd FileType ruby nnoremap <Leader>pri :-1read ~/dot-files/vim-nanotemplate/tpl.ruby.pri.rb<CR>
      autocmd FileType ruby nnoremap <Leader>reg :-1read ~/dot-files/vim-nanotemplate/tpl.ruby.reg.rb<CR>
      autocmd FileType ruby nnoremap <Leader>swi :-1read ~/dot-files/vim-nanotemplate/tpl.ruby.swi.rb<CR>
      autocmd FileType ruby nnoremap <Leader>whi :-1read ~/dot-files/vim-nanotemplate/tpl.ruby.whi.rb<CR>

    endif

  augroup END

endif " if exists("did_load_filetypes")

" === snippets end

" === fzf start

" to preview files during :files command
command! -bang -nargs=* -complete=dir Files
      \ call fzf#vim#files(<q-args>,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

" === fzf end

