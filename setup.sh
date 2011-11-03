#!/bin/sh
echo "setting up zsh config"
BASEDIR="$( cd -P "$( dirname "$0" )" && pwd )"

# Remove previous configuration and link to destination if not cloned directly there
if [ "$BASEDIR" != "$HOME/.zsh" ]; then
    echo "...removing previous configuration"
    rm -rf ~/.zsh
    rm ~/.zshrc

    echo "...linking ~/.zsh and ~/.zshrc"
    ln -s $BASEDIR ~/.zsh
    ln -s $BASEDIR ~/.zshrc
else
    echo "...removing previous configuration"
    rm ~/.zshrc

    echo "...linking ~/.zshrc"
    ln -s $BASEDIR ~/.zshrc
fi

echo "...creating ~/.zsh/local/zshrc for local customizations"
echo '# Automatically sourced from ~/.zshrc, add your local customizations here.' > ~/.zsh/local/zshrc

echo "...done!"
