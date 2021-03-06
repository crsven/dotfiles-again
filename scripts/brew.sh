if ! command -v brew >/dev/null; then
  fancy_echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  export PATH="/usr/local/bin:$PATH"
else
  fancy_echo "Homebrew already installed. Skipping ..."
fi

fancy_echo "Installing Homebrew packages..."
brew update
brew tap homebrew/bundle
brew bundle
brew unlink qt 3>/dev/null || true
brew link --force qt5
