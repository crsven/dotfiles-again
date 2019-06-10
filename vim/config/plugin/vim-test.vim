map <Leader>ts :TestNearest<CR>
map <Leader>tf :TestFile<CR>
map <Leader>ta :TestSuite<CR>

let test#strategy = "vimux"

let test#python#pyunit#options = {
  \ 'suite':   '--failfast',
\}
let test#python#pyunit#executable = 'dcr web python3 ./manage.py test'
