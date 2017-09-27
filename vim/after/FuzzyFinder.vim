" Disable modes
let g:fuf_modesDisable = [ 'mrufile', 'mrucmd', 'file', 'dir', 'buffer', 'bookmarkfile', 'bookmarkdir', 'buffertag', 'taggedfile', 'jumplist', 'changelist', 'quickfix', 'line', 'help', 'tags' ]

" Disable files/dirs
let g:fuf_file_exclude = '\vtmp|node_modules|\~$|\.(o|exe|dll|bak|orig|swp|jpg|png|gif)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
let g:fuf_coveragefile_exclude = '\vtmp|node_modules|\~$|\.(o|exe|dll|bak|orig|swp|jpg|png|gif)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
let g:fuf_dir_exclude = '\vtmp|node_modules|*tmp-mixture.*'

" Colors
highlight Pmenu ctermfg=white ctermbg=gray guibg=white

nnoremap <leader>fr :FufRenewCache<cr>
