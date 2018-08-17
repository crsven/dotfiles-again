#!/bin/sh

set -e

fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}

if ! command -v brew >/dev/null; then
  fancy_echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  export PATH="/usr/local/bin:$PATH"
else
  fancy_echo "Homebrew already installed. Skipping ..."
fi

fancy_echo "Installing base16-shell..."
if test -e ~/.config/base16-shell; then
  pushd ~/.config/base16-shell
  git pull
  popd
else
  git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
fi

fancy_echo "Installing Homebrew packages..."
brew update
brew tap homebrew/bundle
brew bundle
brew unlink qt 2>/dev/null || true
brew link --force qt5

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

fancy_echo "Linking dotfiles into ~..."
RCRC=rcrc rcup -v

fancy_echo "Creating Vim undo directory..."
mkdir -p ~/.vim/undo
mkdir -p ~/.vim/swp

fancy_echo "Installing Vim packages..."
vim +PluginUpdate +qall

source scripts/asdf.sh

fancy_echo "Changing your shell to zsh ..."
if ! grep "$(which zsh)" /etc/shells; then
  sudo sh -c 'echo "$(which zsh)" >> /etc/shells'
fi
chsh -s "$(which zsh)"

fancy_echo "Installing zgen..."
if test -e ~/.zgen/zgen.zsh; then
  fancy_echo "zgen installed, updating..."
  source ~/.zgen/zgen.zsh
  zgen selfupdate
  zgen update
else
  git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
fi

source system/osx.sh
