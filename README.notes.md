
## groovy

lazymaps in groovy are build once maps meant to save on memory. this is used in replacement of maps.

## aws

various instance and aws resource meta data can be accessed via curl from the resource itself.
curl -s 169.254.169.254/latest/meta-data/instance-type

## fzf

ctrl-T          load file search with fzf
ctrl+r          load history search with fzf
**

## vim

vi -u NONE      load vim without any plugins

motions

a               around
i               inside (cit = change in tag (<html>something</html>)
hjkl            motions
gg / G          begin / end page
b / w           before and after word
0^$             end and start of line

verbs (you can double down on each verb)

c               change
cw              change then word
y               yank or copy
p / P           paste (cannot double)
t               tag
i               insert
o / O           add new line and insert

registers

reg             load all registers
<c-r> 5         insert mode (paste register 5)
"5y             load yank into register 5

others

/ / ?           / search forward ? search backward
n / N           go next or previous term when in search
g/term/normA    search and execute a command (normA)
s/term/rep      search and replace
%s/term/rep     search and replace (entire file)
r!date          read from command date into line
<c-w>h          select window to h (right)
ctrl+z          background progress
fg              foreground progress
ci'             change in quote
ca"             change around quote
cf.             change from cursor to first occurrence "." including "."
ct.             change from cursor to first occurrence "."
cs              change surrounding (use vim surround)
y2j             copy two lines

plugins recommended

- vim surround
- coc (conquerer of completion)

reference

- power of g
- upcase by thoughtbot

## intelliJ

crtl+shift+r    run test method

+b / w           before and after word

## git

to rebase own branch, where sha is the commit and ~ will include current
$ git rebase -i <sha>~
