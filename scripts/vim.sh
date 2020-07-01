fancy_echo "Creating Vim undo directory..."
mkdir -p ~/.vim/undo
mkdir -p ~/.vim/swp

fancy_echo "Installing Vim packages..."
vim +PlugInstall +qall
