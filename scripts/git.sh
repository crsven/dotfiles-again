fancy_echo "Installing git signing key ignore filter..."
git config filter.nokey.clean "sed '/signingkey =/'d"
git config filter.nokey.smudge "cat"
