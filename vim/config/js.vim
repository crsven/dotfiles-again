augroup JavascriptCommands
  autocmd!
  autocmd FileType javascript,javascriptreact map <Leader>co :call ConsoleLogIt()<CR>
augroup END

function! Clean(input_string)
  let nospaces=substitute(a:input_string, '^\s*\(.\{-}\)\s*$', '\1', '')
  let nosemicolon=substitute(nospaces, ';$', '', 'g')
  return nosemicolon
endfunction

function! ConsoleLogIt()
  let indentString = ""
  let currentIndent = indent('.')
  let i = 0
  while i < currentIndent
    let indentString = indentString." "
    let i += 1
  endwhile
  execute "normal! yiwO\<ESC>p"
  execute "normal! ciwconsole.log(\"\<ESC>pA: \", )\<ESC>PA;"
  let currentLine = getline(line("."))
  call setline(line("."), indentString.currentLine)
endfunction
