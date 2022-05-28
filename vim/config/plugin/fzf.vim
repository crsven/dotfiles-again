set rtp+=/Users/csvenningsen/.homebrew/bin/fzf
nnoremap <C-p> :Files<CR>

" Sid's setup for floating window
let g:fzf_layout = {
  \ 'window': {
    \ 'width': 0.8,
    \ 'height': 0.3,
    \ 'yoffset': 0.2
  \ }
\ }
let g:fzf_preview_window = ''
