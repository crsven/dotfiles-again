nnoremap <Leader>ts :TestNearest<CR>
nnoremap <Leader>tf :TestFile<CR>
nnoremap <Leader>ta :TestSuite<CR>

let test#strategy = "vimux"
let g:test#runner_commands = ['Jest', 'Nose']
nnoremap <Leader>td :call TestDirectory(target_env)<CR>
