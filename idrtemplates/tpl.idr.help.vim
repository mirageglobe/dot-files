" IDR (i dont remember) template help file

" IDR detects current language and applies common snippet

" === common commands

<C-w> ->          " switch to IDR help
<C-w> <-          " switch to main buffer
:q                " close IDR help

" === IDR commands

:IDR              " load IDR help
:IDRhelp          " load default help of code for detected language

:IDRscaffold      " create a basic file scaffold starter

:IDRarray         " add snippet - array
:IDRclass         " add snippet - class
:IDRecho          " add snippet - echo print
:IDRfunction      " add snippet - function
:IDRif            " add snippet - if elseif else
:IDRloop          " add snippet - while for loop
:IDRregex         " add snippet - regular expression
:IDRswitch        " add snippet - switch case
:IDRvariable      " add snippet - variable string int

:IDRstansible     " switch to filetype ansible
:IDRstterraform   " switch to filetype terraform
:IDRstorigin      " switch to original filetype
