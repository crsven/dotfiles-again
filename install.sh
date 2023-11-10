#!/bin/sh

set -e

fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
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

CURRENT_SHELL=$(echo $0)
if [[ $CURRENT_SHELL != *zsh ]]; then
  fancy_echo "Please re-run in a new tab/window with ZSH"
  exit 1
fi

source scripts/asdf.sh
source system/osx.sh

source scripts/bin.sh
source scripts/fonts.sh
source scripts/git.sh
fancy_echo "Bootstrapped!"
