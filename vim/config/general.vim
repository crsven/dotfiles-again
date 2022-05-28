" Leader mapping
let mapleader = ","

" Save
nnoremap <leader>w :w!<cr>

" Quit
nnoremap <leader>q :q<cr>
nnoremap <leader>zz :wq!<cr>

" Remove search term highlights
nnoremap <leader>nh :nohl<cr>

" Map Ctrl-J to <esc>
inoremap <C-j> <Esc>

" " Tab navigation
noremap <C-H> gT
noremap <C-L> gt

nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" Please don't show Help when I miss the 1, escape or tilde buttons
nnoremap <F1> :echo<CR>
inoremap <F1> <C-o>:echo<CR>

" :set hidden
set title

" Paste toggle
set pastetoggle=<F2>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

"set textwidth=80
set colorcolumn=81
set formatoptions-=t
highlight ColorColumn guibg=#1c1c1c ctermbg=234 ctermfg=160

autocmd FileType markdown setlocal wrap

set autoread

nnoremap <leader>rr :redraw!<cr>
