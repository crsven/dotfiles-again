echo "Installing tool versions..."

echo "Installing ruby..."
if [ -d ~/.asdf/plugins/ruby ]; then
  asdf plugin update ruby
else
  asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
fi
# asdf install ruby latest

echo "Installing nodejs..."
if [ -d ~/.asdf/plugins/nodejs ]; then
  asdf plugin update nodejs
else
  asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
fi
asdf install nodejs latest

echo "Installing python..."
if [ -d ~/.asdf/plugins/python ]; then
  asdf plugin update python
else
  asdf plugin add python https://github.com/asdf-community/asdf-python.git
fi
asdf install python latest

