map <Leader>ts :TestNearest<CR>
map <Leader>tf :TestFile<CR>
map <Leader>ta :TestSuite<CR>

let test#strategy = "vimux"
let test#javascript#jest#executable = 'yarn test'
