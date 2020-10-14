" IDR (i dont remember) template help file

" IDR detects current language and applies common snippet
" this is the source for idrtemplates (I dont remember templates)
"
" the goal of this project/plug-in is to fulfil the following:
" - detect the current language in buffer and loads corresponding templates
" - read (.idrtemplates) as snippets for common code
" - extendable for key mappings
" - no dependencies
" - recommended install for FT detection : https://github.com/sheerun/vim-polyglot

" === common commands

<C-w> ->          " switch to IDR help
<C-w> <-          " switch to main buffer
:q                " close IDR help

" === IDR commands

:IDR              " load IDR help
:IDRhelp          " load default help reference for code

:IDRftorigin      " switch to original filetype
:IDRscaffold      " create a basic file scaffold starter

:IDRarray         " add snippet - array
:IDRclass         " add snippet - class
:IDRfunction      " add snippet - function
:IDRif            " add snippet - if elseif else
:IDRloop          " add snippet - while for loop
:IDRprint         " add snippet - echo print
:IDRregex         " add snippet - regular expression
:IDRswitch        " add snippet - switch case
:IDRvariable      " add snippet - variable string int

" === languages

languages             base-help       scaffold        IDRcmds

ansible               ✓               ✓               ✓
bash                  ✓               ✓               ✓
c                     ✓               progress        progress
docker                progress        ✓               n/a
dotgraphs             progress        ✓               n/a
go                    ✓               progress        progress
html                  ✓               ✓               n/a
javascript            ✓               ✓               ✓
lua                   progress        progress        progress
markdown              ✓               progress        n/a
php                   ✓               progress        progress
python                ✓               ✓               ✓
ruby                  ✓               ✓               ✓
rust                  progress        progress        progress
terraform             progress        progress        n/a
vim                   ✓               progress        progress
vue                   progress        progress        progress
