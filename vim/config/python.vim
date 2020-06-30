" let g:python3_host_prog = '/Users/chrissvenningsen/.asdf/shims/python'
" let g:pythonx_host_prog = '/Users/chrissvenningsen/.asdf/shims/python'
set pyxversion=3
let g:pyindent_searchpair_timeout=10

autocmd FileType python map <leader>pp :call PrettyPrintThing()<CR>

function! PrettyPrintThing()
    let indentString = ""
    let currentIndent = indent('.')
    let i = 0
    while i < currentIndent
      let indentString = indentString." "
      let i += 1
    endwhile
    let prettyPrintImport = "import pprint; pp = pprint.PrettyPrinter()"
    call append(line(".")-1,'')
    call setline(line(".")-1, indentString.prettyPrintImport)
    execute "normal! yiwO\<ESC>p"
    execute "normal! ciwpp.pprint()\<ESC>P"
    let currentLine = getline(line("."))
    call setline(line("."), indentString.currentLine)
    write
endfunction

autocmd FileType python map <leader>po :call PrintThing()<CR>

function! PrintThing()
    let indentString = ""
    let currentIndent = indent('.')
    let i = 0
    while i < currentIndent
      let indentString = indentString." "
      let i += 1
    endwhile
    execute "normal! yiwO\<ESC>p"
    execute "normal! ciwprint(\"\<ESC>pA: \", )\<ESC>P"
    let currentLine = getline(line("."))
    call setline(line("."), indentString.currentLine)
    write
endfunction
