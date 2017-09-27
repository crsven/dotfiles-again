" docs
autocmd FileType vim setlocal keywordprg=:help
autocmd FileType ruby setlocal keywordprg=ri

"quickfix
"map <leader>fn :cnext<cr>
"map <leader>fp :cprev<cr>
"map <leader>fo :copen<cr>
"map <leader>fc :ccl<cr>

"grep
"nmap fw :grep -r <cword> . <cr>

"syntax errors
autocmd FileType ruby nmap <buffer> <leader>sc :cexpr system('ruby -c ' . bufname("%"))<cr>

"linter
"autocmd FileType ruby nmap <buffer> <leader>li :cexpr system('bundle exec rubocop ' . bufname("%"))<cr>

"ctags
"set tags=.ctags;$HOME
"nmap <leader>gt :execute "!ctags -R -f ./.ctags ."<cr>
"nmap fd <C-]>
"nmap gq <C-t>
