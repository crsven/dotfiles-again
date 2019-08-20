augroup JavascriptCommands
  autocmd!
  autocmd FileType javascript map <Leader>co :call ConsoleLogIt()<CR>
augroup END

function! Clean(input_string)
  let nospaces=substitute(a:input_string, '^\s*\(.\{-}\)\s*$', '\1', '')
  let nosemicolon=substitute(nospaces, ';$', '', 'g')
  return nosemicolon
endfunction

function! ConsoleLogIt()
  let line=Clean(getline('.'))
  let linenumber=line('.')
  let filename=expand('%')
  let output="console.log('".filename.":".linenumber." ::', ".line.")"
  call setline('.', output)
endfunction
