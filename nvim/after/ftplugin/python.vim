setlocal tabstop=4
setlocal shiftwidth=4
setlocal autoindent
setlocal expandtab
setlocal backspace=indent,eol,start
"setlocal smarttab

" {{{ Mappings
nnoremap <buffer><silent> <space>pf <cmd>Pytest file<CR>
nnoremap <buffer><silent> <space>pc <cmd>Pytest function<CR>
nnoremap <buffer><silent> <space>pm <cmd>Pytest method<CR>
nnoremap <buffer><silent> <space>ps <cmd>Pytest session<CR>

nnoremap <buffer><silent> <F5> <cmd>term python3.10 %<CR>
" }}}
