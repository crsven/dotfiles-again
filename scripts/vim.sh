fancy_echo "Installing Vundler..."
if test -e ~/.vim/bundle/Vundle.vim; then
	fancy_echo "Vundler already installed, updating..."
  pushd ~/.vim/bundle/Vundle.vim
  git pull
  popd
else
  mkdir -p ~/.vim/bundle
  pushd ~/.vim/bundle
  git clone https://github.com/gmarik/Vundle.vim.git
  popd
fi

fancy_echo "Creating Vim undo directory..."
mkdir -p ~/.vim/undo
mkdir -p ~/.vim/swp

fancy_echo "Installing Vim packages..."
vim +PluginUpdate +qall
