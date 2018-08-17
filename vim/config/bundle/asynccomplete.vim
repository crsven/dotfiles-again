"call asyncomplete#register_source(asyncomplete#sources#tscompletejob#get_source_options({
    "\ 'name': 'tscompletejob',
    "\ 'whitelist': ['typescript'],
    "\ 'completor': function('asyncomplete#sources#tscompletejob#completor'),
    "\ }))

"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
""inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

"set completeopt+=preview
