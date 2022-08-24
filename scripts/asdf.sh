echo "Installing asdf"
if ! test -e ~/.asdf/asdf.sh; then
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2
else
  echo "asdf already installed"
fi
asdf update

echo "Installing tool versions..."

echo "Installing ruby..."
if [ -d ~/.asdf/plugins/ruby ]; then
  asdf plugin-update ruby
else
  asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
fi
# asdf install ruby latest

echo "Installing nodejs..."
if [ -d ~/.asdf/plugins/nodejs ]; then
  asdf plugin-update nodejs
else
  asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
fi
asdf install nodejs latest

echo "Installing erlang..."
if [ -d ~/.asdf/plugins/erlang ]; then
  asdf plugin-update erlang
else
  asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
fi
asdf install erlang latest

echo "Installing elixir..."
if [ -d ~/.asdf/plugins/elixir ]; then
  asdf plugin-update elixir
else
  asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
fi
asdf install elixir latest
