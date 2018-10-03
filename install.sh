#!/bin/sh

set -e

fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}

export -f fancy_echo

source scripts/brew.sh
source scripts/base-16.sh

fancy_echo "Linking dotfiles into ~..."
RCRC=rcrc rcup -v

source scripts/vim.sh
source scripts/asdf.sh
source scripts/zsh.sh
source system/osx.sh

fancy_echo "Installing scripts to /usr/local/bin..."
ln -s $(pwd)/bin/* /usr/local/bin

fancy_echo "Installing fonts to ~/Library/Fonts..."
ln -s $(pwd)/fonts/* ~/Library/Fonts

source system/git.sh
