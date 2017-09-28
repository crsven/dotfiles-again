" Leader mapping
let mapleader = ","

" Save
nmap <leader>w :w!<cr>

" Quit
nmap <leader>q :q<cr>
nmap <leader>zz :wq!<cr>

" Remove search term highlights
nmap <leader>nh :nohl<cr>

" Map Ctrl-J to <esc>
imap <C-j> <Esc>

" " Tab navigation
map <C-H> gT
map <C-L> gt

nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" Please don't show Help when I miss the 1, escape or tilde buttons
nmap <F1> :echo<CR>
imap <F1> <C-o>:echo<CR>

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

" persistant undo
if has('persistent_undo')
  set undodir=$HOME/.undo
  set undofile
endif
