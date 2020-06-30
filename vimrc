call plug#begin('~/.vim/plugged')

" Let Vundle manage Vundle
Plug 'gmarik/Vundle.vim'

" Plugs
Plug 'vim-scripts/L9'
Plug 'mbbill/undotree'
Plug 'scrooloose/nerdcommenter'
Plug 'tsaleh/vim-align'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-projectionist'
Plug 'flazz/vim-colorschemes'
Plug 'rizzatti/dash.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-abolish'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'

"Rails dev
" Plug 'tpope/vim-rails'
" Plug 'tpope/vim-rake'

"Searching
Plug 'rking/ag.vim'
Plug 'junegunn/fzf.vim'

"Nerdtree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

"Tmux integration
Plug 'benmills/vimux'
Plug 'tmux-plugins/vim-tmux-focus-events'

"Testing plugins
Plug 'janko-m/vim-test'

" Language support
Plug 'vim-python/python-syntax'
" Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'hail2u/vim-css3-syntax'

Plug 'tidalcycles/vim-tidal'

call plug#end()

filetype plugin indent on
syntax enable

" delegate configuration to files in config/
runtime! config/*.vim
runtime! config/plugin/*.vim
