set nocompatible

" Vundle stuff
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'vim-scripts/L9.git'
Plugin 'sjl/gundo.vim.git'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tsaleh/vim-align.git'
Plugin 'tpope/vim-endwise.git'
Plugin 'tpope/vim-fugitive.git'
Plugin 'michaeljsmith/vim-indent-object.git'
Plugin 'tpope/vim-repeat.git'
Plugin 'tpope/vim-surround.git'
Plugin 'mattn/emmet-vim.git'
Plugin 'ervandew/supertab.git'
Plugin 'malkomalko/projections.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'rizzatti/dash.vim'
Plugin 'Shutnik/jshint2.vim'
Plugin 'editorconfig/editorconfig-vim'

"Rails dev
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-rake.git'

"Searching
Plugin 'rking/ag.vim'
Plugin 'ctrlpvim/ctrlp.vim'

"Nerdtree
Plugin 'scrooloose/nerdtree.git'

"Tmux integration
Plugin 'benmills/vimux'
Plugin 'tmux-plugins/vim-tmux-focus-events'

"Testing plugins
Plugin 'cloud8421/vimux-cucumber'
Plugin 'pgr0ss/vimux-ruby-test'

" Language support
Plugin 'lunaru/vim-less'
Plugin 'digitaltoad/vim-jade'
Plugin 'slim-template/vim-slim'
Plugin 'nono/vim-handlebars'
Plugin 'kchmck/vim-coffee-script.git'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'elixir-lang/vim-elixir'

"Clojure
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'kien/rainbow_parentheses.vim'

"Processing
Plugin 'sophacles/vim-processing'

Plugin 'w0rp/ale'

call vundle#end()
filetype plugin indent on
syntax enable

" delegate configuration to files in config/
runtime! config/**/*.vim
runtime! after/**/*.vim
