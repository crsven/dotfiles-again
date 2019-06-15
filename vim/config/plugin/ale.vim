" Navigate ale w/ ctrl-j/k
nnoremap <C-k> :ALEPreviousWrap<cr>
nnoremap <C-j> :ALENextWrap<cr>
nnoremap <leader>fr :ALEFindReferences<cr>
nnoremap <leader>gd :ALEGoToDefinition<cr>

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'python': ['isort', 'black'],
\}

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['flake8', 'mypy', 'pyls'],
\}

" let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_close_preview_on_insert = 1
set omnifunc=ale#completion#OmniFunc
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-X><C-O>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

let g:ale_elixir_elixir_ls_release = '/usr/local/bin/elixir-ls'
let g:ale_python_flake8_options = '--ignore E501,W503'
let g:ale_python_flake8_change_directory = 0
let g:ale_python_mypy_options = '--ignore-missing-imports'
let g:ale_python_pyls_config = {
\   'pyls': {
\     'plugins': {
\       'pycodestyle': {
\         'enabled': v:false
\       }
\     }
\   },
\ }
