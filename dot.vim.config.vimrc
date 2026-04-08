" # ======================================================== vim config ===== #

" note: this config is for vim (original vi improved). it is not for neovim.
" for neovim, use init.lua or init.vim in ~/.config/nvim/ instead.

" source this file from ~/.vimrc or $HOME/.vimrc using:

" if filereadable(expand("~/dot-files/dot.vimrc"))
"   source ~/dot-files/dot.vimrc
" endif

" optionally source a local override file (e.g. project-specific config):
" if filereadable(expand("~/dot-case/idr/dot.idr.vimrc"))
"   source ~/dot-case/idr/dot.idr.vimrc
" endif

" # ========================================================= reference ===== #

" - https://tbaggery.com/2011/08/08/effortless-ctags-with-git.html
" - https://vimways.org/2018/you-should-be-using-tags-in-vim/

" # ======================================== iterm2 fonts configuration ===== #

" recommended iTerm2 font settings to match the vim-devicons and lightline setup:
" font                          FiraCode Nerd Font, Regular, size 12
" use built-in powerline glyphs true
" enable subpixel anti-aliasing true
" use ligatures                 true
" anti-aliased                  true

" # ====================================================== config start ===== #

" set lazyredraw                  " do not redraw when executing macros;
                                " buffer instead of constant redraws
set noshowmode                  " speed up by turning off showing mode
" set showmode                    " show current mode down the bottom

set nocompatible                " required by vim for extra features
set showcmd                     " noshowcmd / showcmd speed up turning off
                                " display of cmds. need to be after nocompatible
set history=1000                " number of commands history to store
set visualbell                  " no sounds
set hidden                      " set current buffer to be hidden when
                                " opening a new file. use :ls to see all
                                " buffers then :b[n] n=buffer number to select

set backspace=indent,eol,start  " set backspace to go previous line etc

set autoread                    " reload buffer when file changes on disk
autocmd FocusGained,BufEnter * checktime

set encoding=UTF-8              " the encoding displayed.
set fileencoding=UTF-8          " the encoding written to file

" # ----------------------------------- colour ----- color ----- themes ----- #

" if gui (macvim) or not gui (iterm/alacritty)
if has('gui_running')
  set guifont=FiraCode\ Nerd\ Font\ Complete:h13
  " set guifont=Inconsolata\ Nerd\ Font\ Complete:h13
endif

" enable 24-bit true-color mode. requires vim > patch 7.4.1799.
" when inside tmux, tmux version 2.2+ is also required for true-color support.

" true-color support: vim patch 7.4.1799+
if (has("termguicolors"))
  " defines how many colors should be used. (maximum: 256, minimum: 0)
  set t_Co=256

  " Restore original TrueColor overrides (needed for some themes)
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  " Disable TrueColor inside tmux + Terminal.app to prevent artifacts
  if $TERM_PROGRAM == "Apple_Terminal" && exists("$TMUX")
    set notermguicolors
  else
    set termguicolors
  endif

  " Fix background color erase
  if exists("$TMUX")
    set t_ut=
  endif
endif

" onedark color scheme settings (unused - kept as reference)
" https://github.com/joshdick/onedark.vim

" explicitly declare 256 color support for onedark
" let g:onedark_termcolors=256

" override specific highlight groups for onedark
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
" - will not work if vim was compiled without +clipboard support (check :version)
" - * and + registers are equivalent on macOS and Windows

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

" completion popup: show menu, don't auto-insert or auto-select (coc recommended)
set completeopt=menuone,noinsert,noselect

" # ----------------------------------------------------------- buffers ----- #

" :ls     list open buffers
" :b N    switch to buffer N

" # ------------------------------------ command ----- vim command line ----- #

" search downward into subdirectories with :find (e.g. :find *.py<tab>)
set path+=**                    " include subdirectories in file search path

" wildmenu/wildmode control command-line (: prompt) tab completion only.
" this is separate from code completion (ale, coc) which works in insert mode.

set wildmenu                    " show command line completion
                                " use :b to find files, :ls for list buffer
set wildmode=list:full          " show command options with double tab

" # ----------------------------------------------- syntax highlighting ----- #

syntax on                       " enable syntax highlighting (must be on for colorschemes)
set list listchars=tab:»·,trail:·
                                " display tabs and trailing spaces visually
" set nolist                      " breaks white space show

" # ------------------------------------------------------ line numbers ----- #

set number                      " show line numbers
" set relativenumber              " enable relative number

" # ------------------------------------------------------ code folding ----- #

" fold shortcuts: za (toggle) / zc (close) / zo (open) / <leader>fc (toggle via mapping)

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

set colorcolumn=80              " show a vertical guide at column 80
set linebreak                   " wrap lines at word boundaries, not mid-word
" set textwidth=80                " set text width to 80 and autowrap
" set wrap                        " set soft wrap for text
set nowrap                      " turn off code wrap

" # -------------------------------------- scrolling ----- mouse cursor ----- #

set cursorline                  " highlight current line
set mouse=a                     " turn on terminal mouse
set scrolloff=5                 " set lines for vertical scroll to trigger
set sidescroll=1                " enable horizontal scroll 1:on 0:off (set wrap off)
set sidescrolloff=5             " set chars for horizontal scrolling to trigger
set timeoutlen=1000             " ms to wait for a mapped key sequence to complete
set ttimeoutlen=0               " ms to wait for a terminal key code (0 = instant)

" # ------------------------------------------------------- spell check ----- #

" z=   suggest corrections for word under cursor
" zg   add word to dictionary
" zw   mark word as incorrect
" [s   jump to previous spelling error
" ]s   jump to next spelling error

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

" increase maxmempattern to avoid E363 error when navigating markdown files
" (triggered by complex patterns matching [ brackets in md)
set mmp=8000                    " max memory (kb) for pattern matching. default: 1000

" # ---------------------------------------- tab spaces for file types  ----- #
"
" autocmd FileType python,doctest set ai ts=4 sw=4 sts=4 et

" # ======================================================== config end ===== #

" # ================================================ preload plug start ===== #

" settings before plugins are loaded

" # --------------------------------------------------- polyglot start ----- #

" polyglot is not active (plugin commented out), settings kept as reference
" let g:terraform_fmt_on_save=1        " auto-format terraform on save
" let g:polyglot_disabled = ['htmldjango']  " disable specific language packs

" # ----------------------------------------------------- polyglot end ----- #

" # --------------------------------------------------------- ale start ----- #

" ale is used for linting only. coc handles LSP and code completion.
" these settings must be defined before ale is loaded.

" disable ale's built-in completion (coc handles completion instead)
let g:ale_completion_enabled = 0

" disable ale's LSP client (coc manages all LSP servers instead)
let g:ale_disable_lsp = 1

" # ----------------------------------------------------------- ale end ----- #

" # ======================================================== plug start ===== #

" auto-install vim-plug if not already present

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" # ---------------------------------------- themes ----- color schemes ----- #

" enables palenight color scheme
" Plug 'drewtempelmeyer/palenight.vim'

" curated collection of colorschemes (includes gruvbox, onedark, nord, etc.)
Plug 'rafi/awesome-vim-colorschemes'

" alternative colorscheme pack (larger, less curated)
" Plug 'flazz/vim-colorschemes'

" individual colorscheme alternatives:
" Plug 'dracula/vim'
" Plug 'lifepillar/vim-gruvbox8'
" Plug 'lifepillar/vim-solarized8'

" # --------------------------------------------------------------- ide ----- #

" lightweight, configurable status bar
Plug 'itchyny/lightline.vim'

" sensible default settings that most vim users would agree on
Plug 'tpope/vim-sensible'

" respect .editorconfig files for consistent style across editors
" note: built-in to Vim 9+ (packadd editorconfig). only needed for Vim < 9.
Plug 'editorconfig/editorconfig-vim'

" fancy start screen showing recent files and sessions
Plug 'mhinz/vim-startify'

" toggle comments: gcc (line) / gc<motion> (range)
Plug 'tpope/vim-commentary'

" make plugin maps repeatable with '.' (used by other tpope plugins)
Plug 'tpope/vim-repeat'

" surround text with quotes/brackets: cs[' (change), ds' (delete), ysiw' (add)
" Plug 'tpope/vim-surround'

" debugger integration via xdebug protocol
" Plug 'vim-vdebug/vdebug'

" # --------------------------------------------------- file management ----- #

" lightweight netrw replacement with fast directory browsing
" Plug 'justinmk/vim-dirvish'

" file explorer with tree view, replaces NERDTree (use :Fern . -drawer)
Plug 'lambdalisue/fern.vim'

" show git status icons in fern tree
" Plug 'lambdalisue/fern-git-status.vim'

" render nerd font icons in fern (requires nerdfont.vim below)
Plug 'lambdalisue/fern-renderer-nerdfont.vim'

" nerd font glyph library used by fern-renderer-nerdfont
Plug 'lambdalisue/nerdfont.vim'

" open ranger file manager inside vim
" Plug 'francoiscabrol/ranger.vim'

" fuzzy finder core - install fzf binary and vim integration
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" fzf vim commands (:Files, :Buffers, :Rg, etc.) - requires junegunn/fzf above
Plug 'junegunn/fzf.vim'

" full-featured file tree explorer (heavier than fern)
" Plug 'preservim/nerdtree'

" enhance netrw: press - to open the directory of the current file
Plug 'tpope/vim-vinegar'

" redundant with fzf :Buffers (already mapped to <leader>ob) - disabled
" Plug 'jlanzarotta/bufexplorer'

" # --------------------------------------------------------------- git ----- #

" show git diff markers (+/-/~) in the sign column
Plug 'airblade/vim-gitgutter'

" full git client inside vim (:Git blame, :Git log, :Git diff, etc.)
Plug 'tpope/vim-fugitive'

" GitHub extension for fugitive - enables :GBrowse to open files on GitHub
Plug 'tpope/vim-rhubarb'

" Bitbucket extension for fugitive - enables :GBrowse for Bitbucket URLs
" Plug 'tommcdo/vim-fubitive'

" redundant with vim-fugitive (FugitiveHead() provides the same branch name) - disabled
" Plug 'itchyny/vim-gitbranch'

" # --------------------------------------------- language ----- syntax ----- #

" sidebar showing ctags for current file (requires ctags: brew install ctags)
" Plug 'majutsushi/tagbar'

" automatic ctag generation on file save (requires gutentags config below)
" Plug 'ludovicchabant/vim-gutentags'

" syntax highlighting for 100+ languages in a single fast-loading pack
" Plug 'sheerun/vim-polyglot'

" synchronous linting (older; ale is the async replacement used here)
" Plug 'scrooloose/syntastic'

" # --------------------------------------------------- code completion ----- #

" lightweight async completion plugin (alternative to coc)
" Plug 'maralla/completor.vim'

" async completion framework with LSP support (alternative to coc)
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-buffer.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Plug 'prabirshrestha/vim-lsp'

" minimal completion plugin that uses vim's built-in sources (alternative to coc)
" Plug 'lifepillar/vim-mucomplete'

" full LSP client with extensions for most languages (active completion plugin)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" AI code completion via Windsurf/Codeium (run :Codeium Auth to activate)
Plug 'Exafunction/windsurf.vim', { 'branch': 'main' }

" # -------------------------------------------------------------- lint ----- #

" async linting engine - used for linting only (coc handles LSP/completion)
Plug 'dense-analysis/ale'
" show ale error/warning counts in lightline statusbar
Plug 'maximbaz/lightline-ale'

" hashicorp language support (uncomment as needed):
" Plug 'hashivim/vim-terraform'             " terraform syntax and formatting
" Plug 'hashivim/vim-consul'                " consul config syntax
" Plug 'hashivim/vim-vagrant'               " vagrantfile syntax
" Plug 'hashivim/vim-nomadproject'          " nomad job spec syntax
" Plug 'hashivim/vim-packer'                " packer config syntax

" additional language support (uncomment as needed):
" Plug 'posva/vim-vue'                      " vue single-file component syntax
" Plug 'pangloss/vim-javascript'            " improved javascript syntax
" Plug 'groenewege/vim-less'                " less css syntax
" Plug 'tpope/vim-markdown'                 " markdown improvements
" Plug 'tpope/vim-rails'                    " rails project navigation
" Plug 'vim-ruby/vim-ruby'                  " ruby syntax and tools

" # ----------------------------------------------------------- snippet ----- #

" snipmate and its dependencies (alternative to coc snippet support):
" Plug 'MarcWeber/vim-addon-mw-utils'       " snipmate dependency
" Plug 'tomtom/tlib_vim'                    " snipmate dependency
" Plug 'garbas/vim-snipmate'                " snippet expansion engine
" Plug 'honza/vim-snippets'                 " community snippet library

" # ------------------------------------------------------------- icons ----- #

" nerd font icon support - must be loaded last so other plugins can register glyphs
Plug 'ryanoasis/vim-devicons'

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

" # ==================================================== startify start ===== #

" change working directory to the vcs root when opening a file from startify
let g:startify_change_to_vcs_root = 1

" auto-save and auto-load sessions named Session.vim in the project root
let g:startify_session_autoload = 1
let g:startify_session_persistence = 1

" number of recent files shown on the start screen
let g:startify_files_number = 10

" # ====================================================== startify end ===== #

" # =================================================== lightline start ===== #

set laststatus=2                " always show statusline (required for lightline)
" noshowmode already set at top of config

" lightline configuration dict - must be defined before any lightline.* extensions

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
      \   'lineinfo': ' %3l:%-2v',
      \   'filetype': '%{&filetype}',
      \   'readonly': '%{&filetype=="help"?"":&readonly?"":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \ }

" component_function is called on every lightline redraw, so git branch updates
" when switching buffers. component entries with %{} do not reliably refresh.
let g:lightline.component_function = {
      \   'gitbranch': 'LightlineFugitive',
      \   'gitgutter': 'LightlineGitGutter'
      \ }

function! LightlineFugitive() abort
  let branch = FugitiveHead()
  return branch !=# '' ? ' ' . branch : ''
endfunction

function! LightlineGitGutter() abort
  if !get(g:, 'gitgutter_enabled', 0) || winwidth(0) < 70
    return ''
  endif
  let [a, m, r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction

let g:lightline.component_visible_condition = {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \ }

" define what appears in the active statusline (left side segments)
let g:lightline.active = {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'gitbranch', 'gitgutter', 'readonly', 'filename', 'modified' ],
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

" nerd font icons for ale status in lightline (requires a nerd font in terminal)
let g:lightline#ale#indicator_checking = "\uf110"  " spinning icon (checking)
let g:lightline#ale#indicator_warnings = "\uf071"  " warning triangle
let g:lightline#ale#indicator_errors = "\uf05e"    " error circle
let g:lightline#ale#indicator_ok = "\uf00c"        " checkmark (all clear)

" # ===================================================== lightline end ===== #

" # ========================================================= ale start ===== #

" ale configured to work alongside coc (ale lints, coc provides LSP/completion)
" see: https://github.com/dense-analysis/ale#faq-coc-nvim

" always show the sign column to prevent layout shifting when errors appear
let g:ale_sign_column_always = 1

" symbols shown in the sign column for errors and warnings
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '??'

" run multiple linters for composite filetypes (e.g. vue uses both vue and js linters)
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

" asyncomplete is not active (plugin commented out), settings kept as reference
" let g:asyncomplete_auto_completeopt = 1
" let g:asyncomplete_enable_for_all = 1
" let b:asyncomplete_enable = 1
" let g:asyncomplete_auto_popup = 1

" # ================================================== asyncomplete end ===== #

" # ========================================================= coc start ===== #

" coc.nvim: LSP client providing go-to-definition, hover docs, diagnostics, etc.
" after first install, extensions are auto-installed via g:coc_global_extensions.
" to install manually: :CocInstall coc-json coc-tsserver

" store coc settings and extension data in this directory
let g:coc_config_home = '~/.config/coc'

" enable coc auto-popup; tab accepts windsurf suggestion, arrows+enter select coc item
let g:coc_enable_auto_complete = 1

" language server extensions to auto-install on startup
let g:coc_global_extensions = [
      \'coc-css',
      \'coc-go',
      \'coc-html',
      \'coc-json',
      \'coc-markdownlint',
      \'coc-pyright',
      \'coc-sh',
      \'coc-solargraph',
      \'coc-texlab',
      \'coc-tsserver',
      \'@yaegassy/coc-volar'
      \]

" some coc language servers have issues with backup files being written mid-edit
set nobackup
set nowritebackup

" reduce updatetime so coc diagnostics and hover appear faster (default: 4000ms)
set updatetime=300

" always show the sign column to prevent text shifting when diagnostics appear
set signcolumn=yes

" tab: accept windsurf suggestion if active, otherwise insert a real tab
" coc popup is navigated with arrow keys and confirmed with enter instead
inoremap <silent><expr> <TAB> codeium#Accept()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" enter: confirm selected completion item, or insert a newline if no item selected
" <C-g>u inserts an undo break point before the newline so it's independently undoable
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" manually trigger completion popup
inoremap <silent><expr> <c-@> coc#refresh()

" navigate diagnostics (errors/warnings) forward and backward
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" LSP navigation - go to definition, type, implementation, references
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" show hover documentation for symbol under cursor
nmap <silent> K :call CocActionAsync('doHover')<CR>

" rename symbol under cursor across the project
nmap <leader>rn <Plug>(coc-rename)

" # =========================================================== coc end ===== #

" # ======================================================== fern start ===== #

let g:fern#renderer = "nerdfont"
" open fern drawer: :Fern . -drawer -toggle -reveal=% -keep
" flags: -drawer (sidebar) / -toggle (open/close) / -reveal=% (show current file)
"        -keep (don't close fern when opening a file) / -width=N (sidebar width, default 30)

" show hidden files by default
let g:fern#default_hidden = 1

" disable default mappings to define our own below
let g:fern#disable_default_mappings = 1

" key mappings applied inside the fern buffer
augroup FernKeymaps
  autocmd!
  autocmd FileType fern call s:FernKeymaps()
augroup END

function! s:FernKeymaps() abort
  " open file or expand/collapse directory
  nmap <buffer> <CR>  <Plug>(fern-action-open-or-expand)
  nmap <buffer> l     <Plug>(fern-action-open-or-expand)
  nmap <buffer> h     <Plug>(fern-action-collapse)
  " file operations
  nmap <buffer> N     <Plug>(fern-action-new-path)
  nmap <buffer> D     <Plug>(fern-action-remove)
  nmap <buffer> R     <Plug>(fern-action-rename)
  nmap <buffer> c     <Plug>(fern-action-copy)
  nmap <buffer> m     <Plug>(fern-action-move)
  " toggle hidden files
  nmap <buffer> zh    <Plug>(fern-action-hidden-toggle)
  " reload tree
  nmap <buffer> r     <Plug>(fern-action-reload)
  " close fern
  nmap <buffer> q     :<C-u>quit<CR>
endfunction

" # ========================================================== fern end ===== #


" # =================================================== gitgutter start ===== #

" signcolumn=yes already set in coc section above

" 0 = preserve other signs (e.g. ale) in the gutter; 1 = gitgutter overwrites them
let g:gitgutter_sign_allow_clobber = 0

" # ===================================================== gitgutter end ===== #

" # =================================================== gutentags start ===== #

" gutentags is not active (plugin commented out), config kept as reference
" https://www.reddit.com/r/vim/comments/d77t6j/guide_how_to_setup_ctags_with_gutentags_properly/

" let g:gutentags_add_default_project_roots = 0
" let g:gutentags_project_root = ['.git']

" let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')

" let g:gutentags_generate_on_new = 1
" let g:gutentags_generate_on_missing = 1
" let g:gutentags_generate_on_write = 1
" let g:gutentags_generate_on_empty_buffer = 0

" debug gutentags issues:
" let g:gutentags_trace = 1
" let g:gutentags_ctags_executable = '/usr/local/bin/ctags'  " set explicit ctags path

" let g:gutentags_ctags_extra_args = [
"       \ '--tag-relative=yes',
"       \ '--fields=+ailmnS',
"       \ ]

" let g:gutentags_ctags_exclude = [
"       \ '*.git', '*.svg', '*.hg',
"       \ '*/tests/*',
"       \ 'build',
"       \ 'dist',
"       \ '*sites/*/files/*',
"       \ 'bin',
"       \ 'node_modules',
"       \ 'bower_components',
"       \ 'cache',
"       \ 'compiled',
"       \ 'docs',
"       \ 'example',
"       \ 'bundle',
"       \ 'vendor',
"       \ '*.md',
"       \ '*-lock.json',
"       \ '*.lock',
"       \ '*bundle*.js',
"       \ '*build*.js',
"       \ '.*rc*',
"       \ '*.json',
"       \ '*.min.*',
"       \ '*.map',
"       \ '*.bak',
"       \ '*.zip',
"       \ '*.pyc',
"       \ '*.class',
"       \ '*.sln',
"       \ '*.Master',
"       \ '*.csproj',
"       \ '*.tmp',
"       \ '*.csproj.user',
"       \ '*.cache',
"       \ '*.pdb',
"       \ 'tags*',
"       \ 'cscope.*',
"       \ '*.css',
"       \ '*.less',
"       \ '*.scss',
"       \ '*.exe', '*.dll',
"       \ '*.mp3', '*.ogg', '*.flac',
"       \ '*.swp', '*.swo',
"       \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
"       \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
"       \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
"       \ ]

" # ===================================================== gutentags end ===== #

" # ================================================== mucomplete start ===== #

" mucomplete is not active (plugin commented out), config kept as reference
" set shortmess+=c                          " suppress completion menu messages
" let g:mucomplete#enable_auto_at_startup = 1   " auto-start on vim launch
" let g:mucomplete#completion_delay = 1         " only activate after a pause in typing
" imap <expr> <down> mucomplete#extend_fwd("\<down>")   " expand completion downward

" # ==================================================== mucomplete end ===== #

" # =================================================== syntastic start ===== #

" syntastic is not active (ale used instead), config kept as reference
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ['standard']
" let g:syntastic_sh_shellcheck_args="-e SC2039"   " allow 'local' in sh scripts

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

" netrw configuration (built-in vim file browser, enhanced by vim-vinegar)
" open with :Lexplore (left split) or press - to open current file's directory
let g:netrw_altv = 1
" let g:netrw_banner = 0          " remove top banner
" let g:netrw_browse_split = 4    " open a new horizontal split for file
let g:netrw_liststyle = 3       " use tree view
" let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'    " hide dot files by default - gh to toggle hiding
let g:netrw_winsize = 25        " set width of tree to 25%

" auto-open netrw on startup (vim-vinegar alternative for project drawer)
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

" # =================================================== vim vinegar end ===== #

" # ========================================================= fzf start ===== #

" first-time fzf shell integration setup (run once in terminal, not in vim):
" $(brew --prefix)/opt/fzf/install

" override fzf default command to include hidden files (excludes .git):
" let $FZF_DEFAULT_COMMAND='find . \! \( -type d -path ./.git -prune \) \! -type d \! -name ''*.tags'' -printf ''%P\n'''

" to use fzf in vim (supports both Intel and Apple Silicon homebrew paths)
if isdirectory('/opt/homebrew/opt/fzf')
  set rtp+=/opt/homebrew/opt/fzf
elseif isdirectory('/usr/local/opt/fzf')
  set rtp+=/usr/local/opt/fzf
endif

" # =========================================================== fzf end ===== #

" # ======================================================= alias start ===== #

" cabbrev creates command-line abbreviations (expanded when typed at : prompt).
" note: do not add inline comments after cabbrev lines - they are read as part of the command.

" open a terminal in a vertical split
" cabbrev termv vertical terminal

" open a terminal in a horizontal split (default split direction)
" cabbrev termh terminal

" # ========================================================= alias end ===== #

" # ======================================== leader ===== mapping start ===== #

" mapping mode prefixes:
" n = normal / v = visual / i = insert / c = command
"
" map variants:
" map / nmap / vmap / imap   recursive (can be remapped by other maps)
" noremap / nnoremap / etc.  non-recursive (preferred - avoids infinite loops)
"
" example: <C-d> means control + d

" set leader key to space (default is backslash \)
let mapleader = "\<space>"

" # ----------------------------------------------------- file explorer ----- #

" open buffer switcher via bufexplorer (replaced by fzf :Buffers below)
" nnoremap <Leader>be :BufExplorer<CR>
" noremap <Leader><SPACE> :BufExplorer<CR>

" open buffer switcher via fzf
nnoremap <Leader>ob :Buffers<CR>

" list all open buffers in the command line
nnoremap <Leader>lb :ls<CR>

" close current buffer without deleting the file
" nnoremap <Leader>db :bdelete<CR>

" open ctags sidebar (requires tagbar plugin)
" nnoremap <Leader>ot :TagbarToggle<CR>

" open file picker via fzf (fullscreen with !)
nnoremap <Leader>of :Files!<CR>

" toggle fern file explorer sidebar
" -keep       keep sidebar when quit
" -reveal=%   show project root
" -stay       stay focus on the origin window
" -width=30   drawer width (default 30)
noremap <Leader>oe :Fern . -drawer -toggle -keep -width=40 -stay -reveal=%<CR>

" open ranger file manager (requires ranger plugin)
" let g:ranger_map_keys = 0
" nnoremap <leader>ore :Ranger<CR>

" open netrw in the current directory
" noremap <Leader>ofe :Explore<CR>

" # -------------------------------------------------------- copy paste ----- #

" copy current line to macOS clipboard / paste from clipboard (macOS only)
" noremap <Leader>cp :.w !pbcopy<CR><CR>
" noremap <Leader>p :.r !pbpaste<CR>

" # --------------------------------------------------- code management ----- #

" toggle fold at cursor (za = toggle / zc = close / zo = open)
nmap <Leader>fc za<ESC>

" live grep search across project using ripgrep (requires rg installed)
nnoremap <leader>rg :Rg<CR>

" # --------------------------------------------------------------- git ----- #

" show git blame for the current file (who changed each line and when)
nnoremap <Leader>gb :Git blame<CR>

" insert a co-author trailer on the current line (edit name/email as needed)
nnoremap <Leader>gca <ESC>ICo-authored-by: John Doe <johndoe@gmail.com><ESC>

" open current line on GitHub in the browser (requires vim-rhubarb)
nnoremap <Leader>go :.GBrowse<CR>

" open visual selection on GitHub (uncomment to enable)
" vnoremap <Leader>ogh :GBrowse<CR>

" # ------------------------------------------------------ common print ----- #

" insert a section divider header above the current line (80 char width)
" tip: use gcc (tpope/vim-commentary) to comment the inserted line if needed
nmap <Leader>ph <ESC>O# ------------------------------------------------------------ CHANGEME ----- #<ESC>0
nmap <Leader>phh <ESC>O# ============================================================ CHANGEME ===== #<ESC>0

" nmap <Leader>ph1 <ESC>gcc<ESC>I===<ESC>gcc<ESC>0
" nmap <Leader>ph2 <ESC>I===<space>section<space>start<ESC>gcc<ESC>0o===<space>section<space>end<ESC>gcc0

" navigate between splits with ctrl+direction (uncomment to enable)
" nnoremap <C-J> <C-W><C-J>   " move to split below
" nnoremap <C-K> <C-W><C-K>   " move to split above
" nnoremap <C-L> <C-W><C-L>   " move to split right
" nnoremap <C-H> <C-W><C-H>   " move to split left

" # ========================================== leader ===== mapping end ===== #

" # ==================================================== commands start ===== #

" # ----------------------------------------- fzf file command override ----- #

" override :Files to add preview window (use :Files or :Files! for fullscreen)
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" # ------------------------------------------------------- reloadrc ------ #

" reload the vimrc without restarting vim
command FoxReloadRc :source ~/dot-files/dot.vimrc

" # ---------------------------------------------------- showshortcuts ------ #

function ShowShortcuts()
  " open a temporary scratch buffer in a bottom split
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile filetype=help
  resize 30

  " populate the buffer
  call setline(1, [
    \ '# ---------------------------------------- vim shortcuts ----- #',
    \ '  press q to close  |  scroll with j/k or ctrl-f/ctrl-b',
    \ '',
    \ '  commands',
    \ '  :FoxReloadRc                  re-source vim config',
    \ '  :FoxShowShortcuts             show this shortcut list  (<leader>sc)',
    \ '  :FoxTrimWhiteSpace            trim trailing whitespace',
    \ '',
    \ '  files / buffers',
    \ '  <leader>of                    open file picker (fzf fullscreen)',
    \ '  <leader>oe                    toggle fern file explorer sidebar',
    \ '  <leader>ob                    open buffer switcher (fzf)',
    \ '  <leader>lb                    list open buffers (:ls)',
    \ '  <leader>rg                    live grep search (ripgrep)',
    \ '  -                             open current file directory (netrw)',
    \ '',
    \ '  code',
    \ '  <leader>fc                    toggle fold (za)',
    \ '  <leader>rn                    rename symbol (coc)',
    \ '  <leader>ph                    insert ----- section header',
    \ '  <leader>phh                   insert ===== section header',
    \ '  gcc                           toggle comment (line)',
    \ '  gc<motion>                    toggle comment (range)',
    \ '  za / zc / zo                  fold toggle / close / open',
    \ '  <tab>                         accept windsurf ai suggestion',
    \ '  <c-@>                         trigger coc completion manually',
    \ '  <s-tab>                       prev coc completion item',
    \ '  <enter>                       confirm coc completion item',
    \ '',
    \ '  git',
    \ '  <leader>gb                    git blame current file',
    \ '  <leader>go                    open current line on github',
    \ '  <leader>gca                   insert co-authored-by trailer',
    \ '  ]c / [c                       next / prev git hunk (gitgutter)',
    \ '  <leader>hp                    preview hunk (gitgutter)',
    \ '  <leader>hs                    stage hunk (gitgutter)',
    \ '  <leader>hu                    undo hunk (gitgutter)',
    \ '',
    \ '  lsp (coc)',
    \ '  gd                            go to definition',
    \ '  gy                            go to type definition',
    \ '  gi                            go to implementation',
    \ '  gr                            go to references',
    \ '  K                             hover documentation',
    \ '  [g / ]g                       prev / next diagnostic',
    \ '  :CocDiagnostics               list all diagnostics',
    \ '',
    \ '  fern explorer (inside sidebar)',
    \ '  <enter> / l                   open file or expand directory',
    \ '  h                             collapse directory',
    \ '  N                             new file or directory',
    \ '  R                             rename',
    \ '  D                             delete',
    \ '  c / m                         copy / move',
    \ '  zh                            toggle hidden files',
    \ '  r                             reload tree',
    \ '  q                             close fern',
    \ '',
    \ '  spelling',
    \ '  z=                            suggest corrections',
    \ '  zg                            add word to dictionary',
    \ '  zw                            mark word as incorrect',
    \ '  ]s / [s                       next / prev spelling error',
    \ ])

  " make buffer read-only and close with q
  setlocal nomodifiable
  nnoremap <buffer> q :quit<CR>
endfunction

command FoxShowShortcuts :call ShowShortcuts()
nnoremap <Leader>sc :FoxShowShortcuts<CR>

" # --------------------------------------------------- trimwhitespace ------ #

function TrimWhiteSpace()
  echom "trim trailing white space"
  :%s/\s\+$//e
endfunction

" remove trailing whitespace from all lines in the buffer
command FoxTrimWhiteSpace :call TrimWhiteSpace()

" # ====================================================== commands end ===== #

" # ========================================== omnicomplete popup start ===== #

" vim built-in completion shortcuts (work without any plugins in insert mode):
" ^x^n    complete from words in this file only
" ^x^f    complete file paths
" ^x^]    complete from ctags
" g^x^]   complete from ctags (global scope)
" ^n      complete from all sources defined by 'complete' option

" function! OpenCompletion()
"   if !pumvisible() && ((v:char >= 'a' && v:char <= 'z') || (v:char >= 'A' && v:char <= 'Z'))
"     call feedkeys("\<C-x>\<C-o>", "n")  " use this for mapping multiple keys
"     call feedkeys("\<C-n>", "n")        " use this for single key
"   endif
"   if !pumvisible() && (v:char == '/')
"     call feedkeys("\<C-x>\<C-f>", "n")
"   endif
" endfunction

" uncomment to enable automatic omnicomplete popup on every keystroke
" autocmd InsertCharPre * call OpenCompletion()

" # ============================================ omnicomplete popup end ===== #
