" # ======================================================== vim config ===== #

" add/replace following lines to file as ~/.vimrc or $HOME/.vimrc
" add the following lines to .vimrc

" if filereadable(expand("~/dot-files/dot.vimrc"))
"   source ~/dot-files/dot.vimrc
" endif

" if you have idr
" if filereadable(expand("~/dot-case/idr/dot.idr.vimrc"))
"   source ~/dot-case/idr/dot.idr.vimrc
" endif

" # ========================================================= reference ===== #

" - https://tbaggery.com/2011/08/08/effortless-ctags-with-git.html
" - https://vimways.org/2018/you-should-be-using-tags-in-vim/

" # ======================================== iterm2 fonts configuration ===== #

" font -> FuraCode Nerd Font [Regular] [12]
" use built-in Powerline glyphs -> true
" enable subpixel anti-aliasing -> true
" use ligatures -> true
" anti-aliased -> true

" # ====================================================== config start ===== #

" set lazyredraw                  " do not redraw when executing macros;
                                " buffer instead of constant redraws
set noshowmode                  " speed up by turning off showing mode
" set showmode                    " show current mode down the bottom
set regexpengine=1              " speed up by using old regex engine

set nocompatible                " required by vim for extra features
set showcmd                     " noshowcmd / showcmd speed up turning off
                                " display of cmds. need to be after nocompatible
set history=1000                " number of commands history to store
set visualbell                  " no sounds
set hidden                      " set current buffer to be hidden when
                                " opening a new file. use :ls to see all
                                " buffers then :b[n] n=buffer number to select

set backspace=indent,eol,start  " set backspace to go previous line etc
set backupcopy=yes              " yes/no/auto when opening a file
                                " vim makes a copy and overwrites

set encoding=UTF-8              " the encoding displayed.
set fileencoding=UTF-8          " the encoding written to file

" # ----------------------------------- colour ----- color ----- themes ----- #

" if gui (macvim) or not gui (iterm/alacritty)
if has('gui_running')
  set guifont=FiraCode\ Nerd\ Font\ Complete:h13
  " set guifont=Inconsolata\ Nerd\ Font\ Complete:h13
endif

" termguicolors (recommendation by onedark theme)
" use 24-bit (true-color) mode in vim/neovim when outside tmux.
" if you're using tmux version 2.2 or later, you can remove the outermost $tmux check and use tmux's 24-bit color support
" (see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)

if (has("nvim"))
  "for neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"for neovim > 0.1.5 and vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"based on vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/following-head#20160511 >
if (has("termguicolors"))
  " defines how many colors should be used. (maximum: 256, minimum: 0)
  set t_Co=256

  " turns on true terminal colors
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  " turns on 24-bit rgb color support
  set termguicolors
endif

" onedark color scheme settings
" https://github.com/joshdick/onedark.vim

" onedark explict declare 256
" let g:onedark_termcolors=256

" onedark color settings
" if (has("autocmd"))
"   augroup colorextend
"     autocmd!
"     " Make `Function`s bold in GUI mode
"     autocmd ColorScheme * call onedark#extend_highlight("Function", { "gui": "bold" })
"     " Override the `Statement` foreground color in 256-color mode
"     autocmd ColorScheme * call onedark#extend_highlight("Statement", { "fg": { "cterm": 128 } })
"     " Override the `Identifier` background color in GUI mode
"     autocmd ColorScheme * call onedark#extend_highlight("Identifier", { "bg": { "gui": "#333333" } })
"   augroup END
" endif

" # --------------------------------------------------------- clipboard ----- #

" <https://vim.fandom.com/wiki/Accessing_the_system_clipboard>
" <https://stackoverflow.com/questions/677986/vim-copy-selection-to-os-x-clipboard>
" - will not work if its -clipboard (not complied with vim)
" - * and + is the same for macosx and windows

if has("clipboard")
  set clipboard=unnamed         " copy to the system clipboard
  if has("unnamedplus")         " X11 support
    set clipboard+=unnamedplus
  endif
endif

" # -------------------------------------------------------- completion ----- #

" http://vimdoc.sourceforge.net/htmldoc/filetype.html

filetype indent plugin on         " enables filetype - plugins,
                                  " indenting rules, syntax highlighting

" toggle omnicomplete options
set completeopt+=menuone,menu,longest,preview
" set completeopt=menuone,noinsert,noselect,preview

" toggle default omnicomplete function
" set omnifunc=syntaxcomplete#Complete

" toggle omnicomplete via ALE
set omnifunc=ale#completion#OmniFunc

" toggle omnicomplete via completor
" set omnifunc=completor#omnifunc

" toggle omnicomplete via asyncomplete
" set omnifunc=asyncomplete#sources#ale#get_source_options
" this has error, check asyncomplete

" # ----------------------------------------------------------- buffers ----- #

" :ls                           " show buffer

" # ------------------------------------ command ----- vim command line ----- #

" :find *<tab>
set path+=**                    " tab completion for file related tasks

" wildmenu and wildmode are used for command line completion. i.e. :color <Tab>
" this is not code completion menu such as ale or coc

set wildmenu                    " show command line completion
                                " use :b to find files, :ls for list buffer
set wildmode=list:full          " show command options with double tab

" # ----------------------------------------------- syntax highlighting ----- #

syntax on                       " set syntax highlighting in vim
                                " required by onedark
set list listchars=tab:»·,trail:·
                                " display tabs and trailing spaces visually
" set nolist                      " breaks white space show

" # ------------------------------------------------------ line numbers ----- #

set number                      " show line numbers
" set relativenumber              " enable relative number

" # ------------------------------------------------------ code folding ----- #

" <leader>z for fold

set foldmethod=indent
set foldnestmax=10
set foldlevel=2
set nofoldenable

" # ------------------------------------------------------- indentation ----- #

" set autoindent
set expandtab
set shiftwidth=2                " indenting at 2 spaces
set smartindent                 " does the right indent in most programs
set softtabstop=2
set tabstop=2                   " tabs are at proper location

" # --------------------------------------------------------- line wrap ----- #

set colorcolumn=80              " set a colour column length at 80
set linebreak                   " set wrap at only
" set textwidth=80                " set text width to 80 and autowrap
" set wrap                        " set soft wrap for text
set nowrap                      " turn off code wrap

" # -------------------------------------- scrolling ----- mouse cursor ----- #

set cursorline                  " highlight current line
set mouse=a                     " turn on terminal mouse
set scrolloff=5                 " set lines for vertical scroll to trigger
set sidescroll=1                " enable horizontal scroll 1:on 0:off (set wrap off)
set sidescrolloff=5             " set chars for horizontal scrolling to trigger
set timeoutlen=1000             " speed up scrolling
set ttimeoutlen=0               " speed up scrolling
set ttyfast                     " speed up loading and scrolling of vim (boolean)
set ttyscroll=10                " set scrolling speed (1-999; 1 fastest)

" # ------------------------------------------------------- spell check ----- #

" z= activate / zg add word to dict / zw mark incorrect to dict
" / [s next / ]s prev

set spell spelllang=en_gb       " turn on vims spell checker
" set nospell                     " explicitly turn off spell check
" set splitright                  " auto split right for screens
set splitbelow                  " auto split bottom for screens (for terminal)

" # -------------------------------------------------------- swap files ----- #

" set noswapfile                  " do not use swap files
set backupdir=~/.vim/.backup//  " set vim to use tmp directory for backup files
set directory=~/.vim/.swp//     " set vim to use tmp directory for swp files
set undodir=~/.vim/.undo//      " set vim to use tmp directory for undo files

" # -------------------------------------------- file specific settings ----- #

" markdown file set textwidth autowrap
au BufRead,BufNewFile *.md setlocal textwidth=80

" # -------------------------------------------------- fix ----- issues ----- #

" fixes maxmempattern error E363 when hitting [ in md files
" https://github.com/vim/vim/issues/2049
set mmp=8000                    " set maxmempattern. default is 1000

" # ---------------------------------------- tab spaces for file types  ----- #
"
" autocmd FileType python,doctest set ai ts=4 sw=4 sts=4 et

" # ======================================================== config end ===== #

" # ================================================ preload plug start ===== #

" settings before plugins are loaded

" # ----------------------------------------------------- polygot start ----- #

" setting polygot terraform-vim
" let g:terraform_fmt_on_save=1

" disable language packs
" let g:polyglot_disabled = ['htmldjango']

" # ------------------------------------------------------- polygot end ----- #

" # --------------------------------------------------------- ale start ----- #

" use ale only for linting (use Coc for code completion)

" this setting must be set before ale is loaded.
" you should not turn this setting on if you wish to use ale as a completion
" source for other completion plugins, like deoplete.
" enable completion where available.
let g:ale_completion_enabled = 1

" automatic imports from external modules
let g:ale_completion_autoimport = 1

" set to 1 for ale to disable language server protocol (use Coc instead)
let g:ale_disable_lsp = 1

" # ----------------------------------------------------------- ale end ----- #

" # ======================================================== plug start ===== #

" auto-install vim-plug

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" # ---------------------------------------- themes ----- color schemes ----- #

" Plug 'drewtempelmeyer/palenight.vim'
" enables palenight color scheme

Plug 'rafi/awesome-vim-colorschemes'
" enables package colorschemes (rafi)

" Plug 'flazz/vim-colorschemes'
" enables package colorschemes (flazz)

" Plug 'dracula/vim'
" Plug 'lifepillar/vim-gruvbox8'
" Plug 'lifepillar/vim-solarized8'

" # --------------------------------------------------------------- ide ----- #

Plug 'itchyny/lightline.vim'
" enables superlight status bar
" <https://github.com/itchyny/lightline.vim>

Plug 'tpope/vim-sensible'
" enables common standard settings for vim

Plug 'editorconfig/editorconfig-vim'
" enables .editorconfig file overrides - https://editorconfig.org/

Plug 'mhinz/vim-startify'
" enables fancy startup

Plug 'tpope/vim-commentary'
" enables commenting - gcc (to [un]comment line) - gc(to comment with motion)

Plug 'tpope/vim-repeat'
" enables repeating command or input with '.'

" Plug 'tpope/vim-surround'
" enables quoting with cs[' to change quotes from [ to ' - cst to add quotes

" Plug 'vim-vdebug/vdebug'
" debugger with xdebug

" # --------------------------------------------------- file management ----- #

Plug 'lambdalisue/fern.vim'
" fern - nerdtree alternative - https://github.com/lambdalisue/fern.vim

Plug 'lambdalisue/fern-renderer-nerdfont.vim'
" fern - nerdfont plugin - https://github.com/lambdalisue/fern-renderer-nerdfont.vim

Plug 'lambdalisue/nerdfont.vim'
" fern - nerdfont plugin - https://github.com/lambdalisue/nerdfont.vim

Plug 'francoiscabrol/ranger.vim'
" netrw alternative ranger - https://github.com/francoiscabrol/ranger.vim

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" enables super fast fuzzy search with :FZF

Plug 'junegunn/fzf.vim'
" needs both lines

" Plug 'preservim/nerdtree'
" netrw alternative drawer

Plug 'tpope/vim-vinegar'
" netrw alternative enables drawer with - key

Plug 'jlanzarotta/bufexplorer'
" buffer explorer

" # --------------------------------------------------------------- git ----- #

Plug 'airblade/vim-gitgutter'
" shows git status in gutter

Plug 'tpope/vim-fugitive'
" run git commands in vim

Plug 'tpope/vim-rhubarb'
" git hub command plugin needed for fugitive to open line in github

" Plug 'tommcdo/vim-fubitive'
" git in vim for bitbucket

Plug 'itchyny/vim-gitbranch'
" simple gitbranch name to replace fugitive

" # --------------------------------------------- language ----- syntax ----- #

" ctags
Plug 'majutsushi/tagbar'
" enables ctag sidebar (install ctag via brew)

Plug 'ludovicchabant/vim-gutentags'
" auto ctag management

" Plug 'sheerun/vim-polyglot'
" syntax highlighting - syntax fast loader 100 languages - https://github.com/sheerun/vim-polyglot

" Plug 'scrooloose/syntastic'

" # --------------------------------------------------- code completion ----- #

" Plug 'maralla/completor.vim'
" <https://github.com/maralla/completor.vim>

" Plug 'prabirshrestha/asyncomplete.vim'
" <https://github.com/prabirshrestha/vim-lsp>

" Plug 'prabirshrestha/asyncomplete-buffer.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Plug 'prabirshrestha/vim-lsp'

" Plug 'lifepillar/vim-mucomplete'
" <https://github.com/lifepillar/vim-mucomplete>

" use ale only for linting (use Coc for code completion)
Plug 'neoclide/coc.nvim', {'branch': 'release'}     " <https://github.com/neoclide/coc.nvim>

" # -------------------------------------------------------------- lint ----- #

" use ale only for linting (use Coc for code completion)
Plug 'dense-analysis/ale'                 " universal language linter
Plug 'maximbaz/lightline-ale'             " ale for lightline

" Plug 'hashivim/vim-terraform'             " syntax for hashicorp
" Plug 'hashivim/vim-consul'                " syntax for hashicorp
" Plug 'hashivim/vim-vagrant'               " syntax for hashicorp
" Plug 'hashivim/vim-nomadproject'          " syntax for hashicorp
" Plug 'hashivim/vim-packer'                " syntax for hashicorp
" Plug 'posva/vim-vue'                      " syntax for vue

" Plug 'pangloss/vim-javascript'
" Plug 'groenewege/vim-less'
" Plug 'tpope/vim-markdown'
" Plug 'tpope/vim-rails'
" Plug 'vim-ruby/vim-ruby'

" # ----------------------------------------------------------- snippet ----- #

" Plug 'MarcWeber/vim-addon-mw-utils'       " snippet tool
" Plug 'tomtom/tlib_vim'                    " snippet tool
" Plug 'garbas/vim-snipmate'                " snippet tool
" Plug 'honza/vim-snippets'                 " snippets - optional

" # ------------------------------------------------------------- icons ----- #

" must be at the end
Plug 'ryanoasis/vim-devicons'             " enables super fonts (nerd fonts for vim)

call plug#end()

" # ========================================================== plug end ===== #

" # ================================================= colorscheme start ===== #

" to select, :colorscheme then space followed by tab

set background=dark

" solarized options
" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"

" colorscheme apprentice
colorscheme gruvbox
" colorscheme onedark

" colorscheme gruvbox8_hard
" colorscheme gruvbox8_soft
" colorscheme gruvbox8
" colorscheme dracula
" colorscheme lucius
" colorscheme nord
" colorscheme OceanicNext
" colorscheme PaperColor
" colorscheme solarized
" colorscheme solarized8
" colorscheme tender

" palenight requires plugin
" colorscheme palenight

" # =================================================== colorscheme end ===== #

" # =================================================== lightline start ===== #

" scriptencoding utf-8            " (optional) unknown setting
set laststatus=2                " (optional) fix for statusline not showing
set noshowmode                  " hide status of mode (insert/visual)
                                " as lightline is showing

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

" popular colorschemes available for lightline
" powerline, apprentice, jellybeans, material, nord, OldHope, PaperColor
" wombat
" https://github.com/itchyny/lightline.vim/blob/master/colorscheme.md

let g:lightline.colorscheme = 'material'

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

" # ----------------------------------------------------- lightline ale ----- #

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

" # ===================================================== lightline end ===== #

" # ========================================================= ale start ===== #

" setting ale to work with coc
" <https://github.com/dense-analysis/ale#faq-coc-nvim>

" enable completion where available
" let g:ale_completion_enabled = 1 (defined in above setting block)

" keep sign gutter open
let g:ale_sign_column_always = 1

" set diagnostic signs to use
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '??'

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
      \ }

" show 5 lines of errors (default: 10)
let g:ale_list_window_size = 5

" set this variable to 1 to autofix on save (see ale_fixers)
" let g:ale_fix_on_save = 1

" # =========================================================== ale end ===== #

" # ================================================ asyncomplete start ===== #

" let g:asyncomplete_auto_completeopt = 1
" let g:asyncomplete_enable_for_all = 1
" let b:asyncomplete_enable = 1
" let g:asyncomplete_auto_popup = 1

" # ================================================== asyncomplete end ===== #

" # ========================================================= coc start ===== #

" <https://github.com/neoclide/coc.nvim>

" setup - run after installing coc or use global_extensions
" :CocInstall coc-json coc-tsserver

" <https://github.com/neoclide/coc.nvim/wiki/Language-servers#terraform>
let g:coc_global_extensions = [
      \'coc-css',
      \'coc-git',
      \'coc-go',
      \'coc-html',
      \'coc-json',
      \'coc-markdownlint',
      \'coc-pyright',
      \'coc-sh',
      \'coc-solargraph',
      \'coc-texlab',
      \'coc-tsserver',
      \'coc-vetur'
      \]

" some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" use tab for trigger completion with characters ahead and navigate.
" note: use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" trigger completion
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
" trigger accept completion
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" <c-space> to trigger completion.
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif

" `[g` and `]g` to navigate diagnostics
" `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" # =========================================================== coc end ===== #

" # ======================================================== fern start ===== #

let g:fern#renderer = "nerdfont"
" to use :Fern . -drawer -toggle -reveal=% -keep
" for root folder, -reveal=%
" to prevent quit, -keep

let g:fern#default_hidden = 1
" show hidden by default

" # ========================================================== fern end ===== #

" # ==================================================== fugitive start ===== #

" set statusline+=%{fugitive#statusline()}

" # ====================================================== fugitive end ===== #

" # =================================================== gitgutter start ===== #

" always show gutter
set signcolumn=yes

" set 1 to cobber other signs or 0 to preserve them
let g:gitgutter_sign_allow_clobber = 0

" # ===================================================== gitgutter end ===== #

" # ================================================== mucomplete start ===== #

" set shortmess+=c
" shut off completion messages

" let g:mucomplete#enable_auto_at_startup = 1
" auto startup mucomplete

" let g:mucomplete#completion_delay = 1
" makes mucomplete less interuptive by only activating on pause

" imap <expr> <down> mucomplete#extend_fwd("\<down>")
" expanding via context see mucomplete-extend-compl

" # ==================================================== mucomplete end ===== #

" # =================================================== syntastic start ===== #

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

" # ===================================================== syntastic end ===== #

" # ================================================= vim vinegar start ===== #

" -       - toggle default project drawer (see netrw)
" I       - show help
" .       - using on a file to populate in command view
" y.      - to yank absolute path for file cursor
" ~       - to go home

" netrw settings (default project drawer for vim)
" <https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/>
" gh      - toggle hidden files
" u       - go to previous directory in history
" -       - go up to parent directory
" enter   - opens a directory or file
" p       - open preview window
" R       - renames file
" d       - creates directory
" D       - deletes file or empty directory
" I       - show help

" activate default treeview for terminal
" :Lexplore to open netrw
let g:netrw_altv = 1
" let g:netrw_banner = 0          " remove top banner
" let g:netrw_browse_split = 4    " open a new horizontal split for file
let g:netrw_liststyle = 3       " use tree view
" let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'    " hide dot files by default - gh to toggle hiding
let g:netrw_winsize = 25        " set width of tree to 25%

" custom hotkey to show explorer (vim vinegar alternatve)
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

" # =================================================== vim vinegar end ===== #

" # ========================================================= fzf start ===== #

" fzf enable fuzzy completion, run following in terminal
" /usr/local/opt/fzf/install

" enable fzf to use find for hidden files
" https://github.com/junegunn/fzf/issues/337
" let $FZF_DEFAULT_COMMAND='find . \! \( -type d -path ./.git -prune \) \! -type d \! -name ''*.tags'' -printf ''%P\n'''

" to use fzf in vim
set rtp+=/usr/local/opt/fzf

" # =========================================================== fzf end ===== #

" # ======================================================= alias start ===== #

" ref - http://learnvimscriptthehardway.stevelosh.com/chapters/03.html
" ref - http://learnvimscriptthehardway.stevelosh.com/chapters/08.html

" i = insert / c = command / v = visual / n = normal
" map = single key map / abbrev = statement map (alias)
" note : do not use comments AFTER the cabbrev line as it reads in as command

" split vertical and launch terminal
" cabbrev termv vertical terminal

" split horizontal (default) and launch terminal
" cabbrev termh terminal

" # ========================================================= alias end ===== #

" # ======================================== leader ===== mapping start ===== #

" https://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping

" map       all recursive map - normal and visual mode (same as remap)
" remap     recursive map (default)
" noremap   non recursive map

" nmap      normal mode - recursive map
" vmap      visual mode - recursive map
" imap      insert mode - recursive map

" nnoremap  normal mode - non recursive map
" vnoremap  visual mode - non recursive map
" inoremap  insert mode - non recursive map

" <C-d>   control + d

" maps base leader key from , to space
let mapleader = "\<space>"

" # ----------------------------------------------------- file explorer ----- #

" buffer explorer open buffer
" nnoremap <Leader>be :BufExplorer<CR>
" noremap <Leader><SPACE> :BufExplorer<CR>

" open buffer - buffer explorer via fzf
nnoremap <Leader>ob :Buffers<CR>

" list buffers - list all buffers
nnoremap <Leader>lb :ls<CR>

" buffer delete current opened buffer (does not delete file)
" nnoremap <Leader>db :bdelete<CR>

" open tag - ctag tagbar - open ctag explorer
nnoremap <Leader>ot :TagbarToggle<CR>

" file explorer open file
" nnoremap <Leader>w <C-w><C-w>
" noremap <Leader>nt :NERDTreeToggle<CR>

" open file - file explorer open file via FZF file explorer
nnoremap <Leader>of :Files!<CR>

" open explorer - file explorer via fern
" -reveal=%   show project root
" -keep       keep sidebar when quit
noremap <Leader>oe :Fern . -drawer -toggle -reveal=% -keep<CR>

" file explorer via ranger
" let g:ranger_map_keys = 0
" nnoremap <leader>ore :Ranger<CR>

" file explorer via netrw tree
" noremap <Leader>ofe :Explore<CR>

" # -------------------------------------------------------- copy paste ----- #

" clipboard copy/paste from clipboard
" noremap <Leader>cp :.w !pbcopy<CR><CR>
" noremap <Leader>p :.r !pbpaste<CR>

" # --------------------------------------------------- code management ----- #

" code folding za / zc / zo
nmap <Leader>fc za<ESC>

" search buffer via ripgrep
nnoremap <leader>rg :Rg<CR>

" # --------------------------------------------------------------- git ----- #

" git browse and blame
" https://jakobgm.com/posts/vim/git-integration/
" show commits for every source line (git blame)
nnoremap <Leader>gb :Git blame<CR>

" git co-author - git pr set co-author
" let @z='ICo-authored-by: y$A <@gmail.com>@Pgua<f x'
" nmap <Leader>@ <ESC>VD <ESC>ICo-authored-by: <CR>
nnoremap <Leader>gca <ESC>ICo-authored-by: John Doe <johndoe@gmail.com><ESC>

" github open - open current line in the browser (github)
nnoremap <Leader>go :.GBrowse<CR>

" open visual selection in the browser (github)
" vnoremap <Leader>ogh :GBrowse<CR>

" # ------------------------------------------------------ common print ----- #

" print template header with 80 char width
" note uses gcc : timpopes auto commenter. method: move begin, prepend === , esc, comment line
nmap <Leader>ph <ESC>O# ------------------------------------------------------------ CHANGEME ----- #<ESC>0
nmap <Leader>phh <ESC>O# ============================================================ CHANGEME ===== #<ESC>0

" nmap <Leader>ph1 <ESC>gcc<ESC>I===<ESC>gcc<ESC>0
" nmap <Leader>ph2 <ESC>I===<space>section<space>start<ESC>gcc<ESC>0o===<space>section<space>end<ESC>gcc0

" split navigations
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

" # ========================================== leader ===== mapping end ===== #

" # ==================================================== commands start ===== #

" to use, run <esc>:<command>

" # ----------------------------------------- fzf file command override ----- #

" fzf - override Files command - https://github.com/junegunn/fzf.vim
" to use, :Files! or :Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" # ------------------------------------------------------ reloadshell ------ #

" reload shell
command ReloadShell :source ~/dot-files/dot.vimrc

" # ---------------------------------------------------- showshortcuts ------ #

function ShowShortcuts()
  echom "# ---------------------------------------- show vim shortcuts ----- #"
  echom " "
  echom ":IDR                          shows IDR (i dont remember) snippets"
  echom ":ReloadShell                  re-sources vim config"
  echom ":ShowShortcuts                show helper shortcuts"
  echom ":TrimWhiteSpace               trims white spaces"
  echom " "
  echom "<leader> of                   open file"
  echom "<leader> ofe                  open/toggle file explore drawer"
  echom "<leader> ob                   open buffer"
  echom "<leader> lsb                  list opened buffer(s)"
  echom "<leader> fc                   toggle fold code"
  echom "<leader> gb                   git blame"
  echom "<leader> gca                  add git co-author"
  echom "<leader> ogh                  open file in github"
  echom "<leader> ph                   print ----- header"
  echom "<leader> phh                  print ===== header"
endfunction

" toggle trim trailing whitespace
command ShowShortcuts :call ShowShortcuts()

" # --------------------------------------------------- trimwhitespace ------ #

function TrimWhiteSpace()
  echom "trim trailing white space"
  :%s/\s\+$//e
endfunction

" toggle trim trailing whitespace
command TrimWhiteSpace :call TrimWhiteSpace()

" # ====================================================== commands end ===== #

" # ========================================== omnicomplete popup start ===== #

" triggers completion without plugins
" <https://stackoverflow.com/questions/35837990/how-to-trigger-omnicomplete-auto-completion-on-keystrokes-in-insert-mode>
" autocomplete omnicomplete shortcuts:
" - ^x^n                        for just this file
" - ^x^f                        for filenames
" - ^x^]                        for tags (ctags) only
" - g^x^]                       for tags (ctags) only global
" - ^n                          for anything specified by complete

" function! OpenCompletion()
"   if !pumvisible() && ((v:char >= 'a' && v:char <= 'z') || (v:char >= 'A' && v:char <= 'Z'))
"     call feedkeys("\<C-x>\<C-o>", "n")  " use this for mapping multiple keys
"     call feedkeys("\<C-n>", "n")        " use this for single key
"   endif
"   if !pumvisible() && (v:char == '/')
"     call feedkeys("\<C-x>\<C-f>", "n")
"   endif
" endfunction

" uncomment line to enable omnicomplete
" autocmd InsertCharPre * call OpenCompletion()

" # ============================================ omnicomplete popup end ===== #
