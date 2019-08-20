nnoremap <Leader>ts :TestNearest<CR>
nnoremap <Leader>tf :TestFile<CR>
nnoremap <Leader>ta :TestSuite<CR>

let test#strategy = "vimux"
let g:test#runner_commands = ['Jest', 'Nose']
let test#python#pyunit#executable = 'python $(find ./ -name "run_tests.py")'
