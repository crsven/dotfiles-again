" call asyncomplete#register_source(asyncomplete#sources#tscompletejob#get_source_options({
    " \ 'name': 'tscompletejob',
    " \ 'whitelist': ['typescript'],
    " \ 'completor': function('asyncomplete#sources#tscompletejob#completor'),
    " \ }))

" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-X><C-O>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

" set completeopt+=preview
" autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
