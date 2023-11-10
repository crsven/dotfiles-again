call plug#begin('~/.vim/plugged')

" " Plugs
Plug 'vim-scripts/L9'
Plug 'mbbill/undotree'
Plug 'scrooloose/nerdcommenter'
Plug 'tsaleh/vim-align'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-projectionist'
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-abolish'

" " Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'

" "Rails dev
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'

" "Searching
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" "Nerdtree
Plug 'scrooloose/nerdtree'

" "Tmux integration
Plug 'benmills/vimux'
Plug 'tmux-plugins/vim-tmux-focus-events'

" "Testing plugins
Plug 'janko-m/vim-test'

" " Language support
" Plug 'vim-python/python-syntax'
" Plug 'hail2u/vim-css3-syntax'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

Plug 'tidalcycles/vim-tidal'

Plug 'embear/vim-localvimrc'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'n0v1c3/vira', { 'do': './install.sh', 'branch': 'dev' }

Plug 'vimwiki/vimwiki'
call plug#end()

filetype plugin indent on
syntax enable

" delegate configuration to files in config/
runtime! config/*.vim
runtime! config/plugin/*.vim

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
