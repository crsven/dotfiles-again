echo "Installing asdf"
if ! test -e ~/.asdf/asdf.sh; then
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.4.0
else
  echo "asdf already installed"
fi

echo "Installing tool versions..."
echo "Installing ruby..."
if [ -d ~/.asdf/plugins/ruby ]; then
  asdf plugin-update ruby
else
  asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
fi
echo "Installing nodejs..."
if [ -d ~/.asdf/plugins/nodejs ]; then
  asdf plugin-update nodejs
else
  asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
  bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
fi
echo "Installing erlang..."
if [ -d ~/.asdf/plugins/erlang ]; then
  asdf plugin-update erlang
else
  asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
fi
echo "Installing elixir..."
if [ -d ~/.asdf/plugins/elixir ]; then
  asdf plugin-update elixir
else
  asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
fi

pushd ~
asdf install
popd
