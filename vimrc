set nocompatible

" Vundle stuff
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'vim-scripts/L9.git'
Plugin 'mbbill/undotree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tsaleh/vim-align.git'
Plugin 'michaeljsmith/vim-indent-object.git'
Plugin 'tpope/vim-repeat.git'
Plugin 'tpope/vim-surround.git'
Plugin 'mattn/emmet-vim.git'
Plugin 'tpope/vim-projectionist'
Plugin 'flazz/vim-colorschemes'
Plugin 'rizzatti/dash.vim'
Plugin 'editorconfig/editorconfig-vim'

" Git
Plugin 'tpope/vim-fugitive.git'
Plugin 'airblade/vim-gitgutter'

"Rails dev
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-rake.git'

"Searching
Plugin 'rking/ag.vim'
Plugin 'junegunn/fzf.vim'

"Nerdtree
Plugin 'scrooloose/nerdtree.git'
Plugin 'Xuyuanp/nerdtree-git-plugin'

"Tmux integration
Plugin 'benmills/vimux'
Plugin 'tmux-plugins/vim-tmux-focus-events'

"Testing plugins
Plugin 'janko-m/vim-test'

" Language support
Plugin 'sheerun/vim-polyglot'

"Clojure
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'kien/rainbow_parentheses.vim'

"Processing
Plugin 'sophacles/vim-processing'

Plugin 'w0rp/ale'
Plugin 'vimwiki/vimwiki'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'leafgarland/typescript-vim'
" Plugin 'Shougo/deoplete.nvim'
" Plugin 'roxma/nvim-yarp'
" Plugin 'roxma/vim-hug-neovim-rpc'
" Plugin 'deoplete-plugins/deoplete-jedi'
" Plugin 'prabirshrestha/asyncomplete.vim'
" Plugin 'prabirshrestha/asyncomplete-buffer.vim'
" Plugin 'runoshun/tscompletejob'
" Plugin 'prabirshrestha/asyncomplete-tscompletejob.vim'

call vundle#end()
filetype plugin indent on
syntax enable

" delegate configuration to files in config/
runtime! config/*.vim
runtime! config/plugin/*.vim
