" === idrtemplates start

let idr_current_filetype = &filetype
let idr_path = "~/dot-files/idrtemplates/"            " path of idr directory

command IDR           :call IDRtoggle(idr_path)       " toggle main idrtemplate reference
command IDRhelp       :call IDRhelp(idr_path)         " show full language default help/template
command IDRscaffold   :call IDRscaffold()             " inject the most common basic template for language

command IDRarray      :call IDRarray()
command IDRif         :call IDRif()
command IDRclass      :call IDRclass()
command IDRecho       :call IDRecho()
command IDRfunction   :call IDRfunction()
command IDRloop       :call IDRloop()
command IDRprint      :call IDRprint()
command IDRregex      :call IDRregex()
command IDRswitch     :call IDRswitch()
command IDRvariable   :call IDRvariable()

command IDRftansible        :call IDRfile("yaml.ansible", idr_current_filetype)         " force toggle to set filetype
command IDRftyaml           :call IDRfile("yaml", idr_current_filetype)                 " force toggle to set filetype
command IDRftjson           :call IDRfile("json", idr_current_filetype)                 " force toggle to set filetype
command IDRftorigin         :call IDRfile(idr_current_filetype, idr_current_filetype)   " toggle to set file as original format

function IDRtoggle(idr_path)
  echom "IDR : activate i dont remember (IDR) templates"
  set splitright
  execute "80vsplit " . fnameescape(a:idr_path) . "tpl.idr.help.vim"
endfunction

function IDRfile(x, c)
  echom "IDR : change filetype detection to - " . a:x . " . original detected filetype is - " . a:c . " ."
  let &filetype = a:x
endfunction

function IDRhelp(idr_path)
  set splitright
  if index(['vim'], &filetype) != '-1'                              " vimrc
    execute "80vsplit " . fnameescape(a:idr_path) . "tpl.vim.vim"
  elseif index(['yaml.ansible'], &filetype) != '-1'                 " ansible yml
    execute "80vsplit " . fnameescape(a:idr_path) . "tpl.ansible.yml"
  elseif index(['conf','sh'], &filetype) != '-1'                    " bash sh
    execute "80vsplit " . fnameescape(a:idr_path) . "tpl.bash.sh"
  elseif index(['c'], &filetype) != '-1'                            " c c
    execute "80vsplit " . fnameescape(a:idr_path) . "tpl.c.c"
  elseif index(['Dockerfile'], &filetype) != '-1'                   " docker dockerfile
    execute "80vsplit " . fnameescape(a:idr_path) . "tpl.docker.dockerfile"
  elseif index(['go'], &filetype) != '-1'                           " go go
    execute "80vsplit " . fnameescape(a:idr_path) . "tpl.go.go"
  elseif index(['html'], &filetype) != '-1'                         " html html
    execute "80vsplit " . fnameescape(a:idr_path) . "tpl.html.html"
  elseif index(['javascript'], &filetype) != '-1'                   " javascript js
    execute "80vsplit " . fnameescape(a:idr_path) . "tpl.javascript.js"
  elseif index(['markdown'], &filetype) != '-1'                     " markdown md
    execute "80vsplit " . fnameescape(a:idr_path) . "tpl.markdown.md"
  elseif index(['php'], &filetype) != '-1'                          " php php
    execute "80vsplit " . fnameescape(a:idr_path) . "tpl.php.php"
  elseif index(['python'], &filetype) != '-1'                       " python py
    execute "80vsplit " . fnameescape(a:idr_path) . "tpl.python.py"
  elseif index(['ruby'], &filetype) != '-1'                         " ruby rb
    execute "80vsplit " . fnameescape(a:idr_path) . "tpl.ruby.rb"
  elseif index(['terraform'], &filetype) != '-1'                    " terraform tf
    execute "80vsplit " . fnameescape(a:idr_path) . "tpl.terraform.tf"
  else
    echom "IDR : syntax not found or file type '" . &filetype . "' not supported. add syntax or run :set ft=<file>."
  endif
endfunction

function IDRscaffold()
  if index(['vim'], &filetype) != '-1'                              " vimrc
    -1read ~/dot-files/idrtemplates/tpl.idr.placeholder.vim
  elseif index(['yaml.ansible'], &filetype) != '-1'                 " ansible yml
    -1read ~/dot-files/idrtemplates/tpl.ansible.scaffold.yml
  elseif index(['conf','sh'], &filetype) != '-1'                    " bash sh
    -1read ~/dot-files/idrtemplates/tpl.bash.scaffold.sh
  elseif index(['c'], &filetype) != '-1'                            " c c
    -1read ~/dot-files/idrtemplates/tpl.c.scaffold.c
  elseif index(['Dockerfile'], &filetype) != '-1'                   " dockerfile dockerfile
    -1read ~/dot-files/idrtemplates/tpl.dockerfile.scaffold.dockerfile
  elseif index(['html'], &filetype) != '-1'                         " html html
    -1read ~/dot-files/idrtemplates/tpl.html.scaffold.html
  elseif index(['javascript'], &filetype) != '-1'                   " javascript js
    -1read ~/dot-files/idrtemplates/tpl.javascript.scaffold.js
  elseif index(['python'], &filetype) != '-1'                       " python py
    -1read ~/dot-files/idrtemplates/tpl.python.scaffold.py
  elseif index(['ruby'], &filetype) != '-1'                         " ruby rb
    -1read ~/dot-files/idrtemplates/tpl.ruby.scaffold.rb
  else
    echom "IDR : syntax not found or file type '" . &filetype . "' not supported. add syntax or run :set ft=<file>."
  endif
endfunction

function IDRarray()
  if index(['vim'], &filetype) != '-1'                              " vimrc
    -1read ~/dot-files/idrtemplates/tpl.idr.placeholder.vim
  elseif index(['yaml.ansible'], &filetype) != '-1'                 " ansible yml
    -1read ~/dot-files/idrtemplates/tpl.ansible.array.yml
  elseif index(['conf','sh'], &filetype) != '-1'                    " bash sh
    -1read ~/dot-files/idrtemplates/tpl.bash.array.sh
  elseif index(['javascript'], &filetype) != '-1'                   " javascript js
    -1read ~/dot-files/idrtemplates/tpl.javascript.array.js
  elseif index(['python'], &filetype) != '-1'                       " python py
    -1read ~/dot-files/idrtemplates/tpl.python.array.py
  elseif index(['ruby'], &filetype) != '-1'                         " ruby rb
    -1read ~/dot-files/idrtemplates/tpl.ruby.array.rb
  else
    echom "IDR : syntax not found or file type '" . &filetype . "' not supported. add syntax or run :set ft=<file>."
  endif
endfunction

function IDRclass()
  if index(['vim'], &filetype) != '-1'                              " vimrc
    -1read ~/dot-files/idrtemplates/tpl.idr.placeholder.vim
  elseif index(['yaml.ansible'], &filetype) != '-1'                 " ansible yml
    -1read ~/dot-files/idrtemplates/tpl.ansible.class.yml
  elseif index(['conf','sh'], &filetype) != '-1'                    " bash sh
    -1read ~/dot-files/idrtemplates/tpl.bash.class.sh
  elseif index(['javascript'], &filetype) != '-1'                   " javascript js
    -1read ~/dot-files/idrtemplates/tpl.javascript.class.js
  elseif index(['python'], &filetype) != '-1'                       " python py
    -1read ~/dot-files/idrtemplates/tpl.python.class.py
  elseif index(['ruby'], &filetype) != '-1'                         " ruby rb
    -1read ~/dot-files/idrtemplates/tpl.ruby.class.rb
  else
    echom "IDR : syntax not found or file type '" . &filetype . "' not supported. add syntax or run :set ft=<file>."
  endif
endfunction

function IDRfunction()
  if index(['vim'], &filetype) != '-1'                              " vimrc
    -1read ~/dot-files/idrtemplates/tpl.vim.function.vim
  elseif index(['yaml.ansible'], &filetype) != '-1'                 " ansible yml
    -1read ~/dot-files/idrtemplates/tpl.ansible.function.yml
  elseif index(['conf','sh'], &filetype) != '-1'                    " bash sh
    -1read ~/dot-files/idrtemplates/tpl.bash.function.sh
  elseif index(['javascript'], &filetype) != '-1'                   " javascript js
    -1read ~/dot-files/idrtemplates/tpl.javascript.function.js
  elseif index(['python'], &filetype) != '-1'                       " python py
    -1read ~/dot-files/idrtemplates/tpl.python.function.py
  elseif index(['ruby'], &filetype) != '-1'                         " ruby rb
    -1read ~/dot-files/idrtemplates/tpl.ruby.function.rb
  else
    echom "IDR : syntax not found or file type '" . &filetype . "' not supported. add syntax or run :set ft=<file>."
  endif
endfunction

function IDRif()
  if index(['vim'], &filetype) != '-1'                              " vimrc
    -1read ~/dot-files/idrtemplates/tpl.vim.if.vim
  elseif index(['yaml.ansible'], &filetype) != '-1'                 " ansible yml
    -1read ~/dot-files/idrtemplates/tpl.ansible.if.yml
  elseif index(['conf','sh'], &filetype) != '-1'                    " bash sh
    -1read ~/dot-files/idrtemplates/tpl.bash.if.sh
  elseif index(['javascript'], &filetype) != '-1'                   " javascript js
    -1read ~/dot-files/idrtemplates/tpl.javascript.if.js
  elseif index(['python'], &filetype) != '-1'                       " python py
    -1read ~/dot-files/idrtemplates/tpl.python.if.py
  elseif index(['ruby'], &filetype) != '-1'                         " ruby rb
    -1read ~/dot-files/idrtemplates/tpl.ruby.if.rb
  else
    echom "IDR : syntax not found or file type '" . &filetype . "' not supported. add syntax or run :set ft=<file>."
  endif
endfunction

function IDRloop()
  if index(['vim'], &filetype) != '-1'                              " vimrc
    -1read ~/dot-files/idrtemplates/tpl.idr.placeholder.vim
  elseif index(['yaml.ansible'], &filetype) != '-1'                 " ansible yml
    -1read ~/dot-files/idrtemplates/tpl.ansible.loop.yml
  elseif index(['conf','sh'], &filetype) != '-1'                    " bash sh
    -1read ~/dot-files/idrtemplates/tpl.bash.loop.sh
  elseif index(['javascript'], &filetype) != '-1'                   " javascript js
    -1read ~/dot-files/idrtemplates/tpl.javascript.loop.js
  elseif index(['python'], &filetype) != '-1'                       " python py
    -1read ~/dot-files/idrtemplates/tpl.python.loop.py
  elseif index(['ruby'], &filetype) != '-1'                         " ruby rb
    -1read ~/dot-files/idrtemplates/tpl.ruby.loop.rb
  else
    echom "IDR : syntax not found or file type '" . &filetype . "' not supported. add syntax or run :set ft=<file>."
  endif
endfunction

function IDRprint()
  if index(['vim'], &filetype) != '-1'                              " vimrc
    -1read ~/dot-files/idrtemplates/tpl.vim.print.vim
  elseif index(['yaml.ansible'], &filetype) != '-1'                 " ansible yml
    -1read ~/dot-files/idrtemplates/tpl.ansible.print.yml
  elseif index(['conf','sh'], &filetype) != '-1'                    " bash sh
    -1read ~/dot-files/idrtemplates/tpl.bash.print.sh
  elseif index(['javascript'], &filetype) != '-1'                   " javascript js
    -1read ~/dot-files/idrtemplates/tpl.javascript.print.js
  elseif index(['python'], &filetype) != '-1'                       " python py
    -1read ~/dot-files/idrtemplates/tpl.python.print.py
  elseif index(['ruby'], &filetype) != '-1'                         " ruby rb
    -1read ~/dot-files/idrtemplates/tpl.ruby.print.rb
  else
    echom "IDR : syntax not found or file type '" . &filetype . "' not supported. add syntax or run :set ft=<file>."
  endif
endfunction

function IDRregex()
  if index(['vim'], &filetype) != '-1'                              " vimrc
    -1read ~/dot-files/idrtemplates/tpl.idr.placeholder.vim
  elseif index(['yaml.ansible'], &filetype) != '-1'                 " ansible yml
    -1read ~/dot-files/idrtemplates/tpl.ansible.regex.yml
  elseif index(['conf','sh'], &filetype) != '-1'                    " bash sh
    -1read ~/dot-files/idrtemplates/tpl.bash.regex.sh
  elseif index(['javascript'], &filetype) != '-1'                   " javascript js
    -1read ~/dot-files/idrtemplates/tpl.javascript.regex.js
  elseif index(['python'], &filetype) != '-1'                       " python py
    -1read ~/dot-files/idrtemplates/tpl.python.regex.py
  elseif index(['ruby'], &filetype) != '-1'                         " ruby rb
    -1read ~/dot-files/idrtemplates/tpl.ruby.regex.rb
  else
    echom "IDR : syntax not found or file type '" . &filetype . "' not supported. add syntax or run :set ft=<file>."
  endif
endfunction

function IDRswitch()
  if index(['vim'], &filetype) != '-1'                              " vimrc
    -1read ~/dot-files/idrtemplates/tpl.idr.placeholder.vim
  elseif index(['yaml.ansible'], &filetype) != '-1'                 " ansible yml
    -1read ~/dot-files/idrtemplates/tpl.ansible.switch.yml
  elseif index(['conf','sh'], &filetype) != '-1'                    " bash sh
    -1read ~/dot-files/idrtemplates/tpl.bash.switch.sh
  elseif index(['javascript'], &filetype) != '-1'                   " javascript js
    -1read ~/dot-files/idrtemplates/tpl.javascript.switch.js
  elseif index(['python'], &filetype) != '-1'                       " python py
    -1read ~/dot-files/idrtemplates/tpl.python.switch.py
  elseif index(['ruby'], &filetype) != '-1'                         " ruby rb
    -1read ~/dot-files/idrtemplates/tpl.ruby.switch.rb
  else
    echom "IDR : syntax not found or file type '" . &filetype . "' not supported. add syntax or run :set ft=<file>."
  endif
endfunction

function IDRvariable()
  if index(['vim'], &filetype) != '-1'                              " vimrc
    -1read ~/dot-files/idrtemplates/tpl.vim.variable.vim
  elseif index(['yaml.ansible'], &filetype) != '-1'                 " ansible yml
    -1read ~/dot-files/idrtemplates/tpl.ansible.variable.yml
  elseif index(['conf','sh'], &filetype) != '-1'                    " bash sh
    -1read ~/dot-files/idrtemplates/tpl.bash.variable.sh
  elseif index(['javascript'], &filetype) != '-1'                   " javascript js
    -1read ~/dot-files/idrtemplates/tpl.javascript.variable.js
  elseif index(['python'], &filetype) != '-1'                       " python py
    -1read ~/dot-files/idrtemplates/tpl.python.variable.py
  elseif index(['ruby'], &filetype) != '-1'                         " ruby rb
    -1read ~/dot-files/idrtemplates/tpl.ruby.variable.rb
  else
    echom "IDR : syntax not found or file type '" . &filetype . "' not supported. add syntax or run :set ft=<file>."
  endif
endfunction

" === idrtemplates end
