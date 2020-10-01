" IDR (i dont remember) template help file

" IDR detects current language and applies common snippet
" this is the source for idrtemplates (I dont remember templates). the goal of this project/plugin is to fulfill the following:

" - it detects the current language in buffer and loads corresponding templates
" - reads (.idrtemplates) as snippets for common code
" - extendable for key mappings
" - no dependencies
" - recommended install for FT : https://github.com/sheerun/vim-polyglot

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

languages             base        scaffold    helpfile

ansible               progress    progress    ✓
bash                  ✓           progress    ✓
c                     progress    progress    ✓
go                    progress    progress    progress
html                  progress    progress    progress
javascript            ✓           ✓           ✓
markdown              n/a         progress    progress
php                   progress    progress    progress
python                ✓           ✓           ✓
ruby                  ✓           ✓           ✓
rust                  progress    progress    progress
vim                   progress    progress    ✓
vue                   progress    progress    progress
