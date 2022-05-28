function! s:execute_script(name, cmd) abort
  let l:current_path = expand('<sfile>:p')
  let script_path = l:current_path . '/bin/' . a:name
  let cmd = join([shellescape(script_path), shellescape(a:cmd)])
  execute 'silent !'.cmd
endfunction

function! kitty#runcmd()
  let l:command = input("Text to send? ")
  let cmd = join(['cd ' . shellescape(getcwd()), l:command], '; ')
  call s:execute_script('kitty_runner', cmd)
endfunction

nnoremap <leader>dk :call kitty#runcmd()<CR>
