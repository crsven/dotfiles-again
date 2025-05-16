#!/bin/sh

set -e

fancy_echo() {
  local fmt="$1"; shift

  printf "\n$fmt\n" "$@"
}

export -f fancy_echo

source scripts/brew.sh
source scripts/apps.sh
source scripts/base-16.sh

fancy_echo "Linking dotfiles into ~..."
RCRC=rcrc rcup -v

source scripts/vim.sh
source scripts/zsh.sh

source scripts/asdf.sh
# source system/osx.sh - needs to updated

source scripts/bin.sh
source scripts/fonts.sh
source scripts/git.sh
fancy_echo "Bootstrapped!"
