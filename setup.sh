#!/bin/sh

echo "Setting up zsh config"
BASEDIR="$( cd -P "$( dirname "$0" )" && pwd )"

echo "...removing previous configuration"
# don't remove configuration files if cloned directly into destination
if [ "$BASEDIR" != "$HOME/.zsh" ]; then
    rm -rf ~/.zsh
fi
rm ~/.zshrc

echo "...linking ~/.zsh and ~/.zshrc"
ln -s $BASEDIR ~/.zsh
ln -s $BASEDIR/zshrc ~/.zshrc

echo "...creating ~/.zsh/local/zshrc for local customizations"
echo '# Automatically sourced from ~/.zshrc, add your local customizations here.' > ~/.zsh/local/zshrc

echo "...done!"
