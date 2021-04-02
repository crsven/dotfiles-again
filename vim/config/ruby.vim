nnoremap <leader>ot :AV<CR>
nnoremap <leader>or :RV<CR>

augroup RubyCommands
  autocmd!
  autocmd FileType ruby map <Leader>co :call PutsIt()<CR>
augroup END

function! PutsIt()
  let indentString = ""
  let currentIndent = indent('.')
  let i = 0
  while i < currentIndent
    let indentString = indentString." "
    let i += 1
  endwhile
  let currentBuffer = bufname('%')
  execute "normal! yiwO\<ESC>p"
  execute "normal! ciwputs(\"\<ESC>pA: \", )\<ESC>PA"
  let currentLine = getline(line("."))
  call setline(line("."), indentString.currentLine)
endfunction
