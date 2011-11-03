#!/bin/sh
echo "setting up zsh config"

# if setup is run from dot-files/setup.sh use basedir provided
if [ "$repo_basedir" ]; then
    basedir=$repo_basedir
else
    basedir="$( cd -P "$( dirname "$0" )" && pwd )"
fi

# remove previous configuration and link to destination if not cloned directly there
if [ "$basedir" != "$home/.zsh" ]; then
    echo "...removing previous configuration"
    rm -rf ~/.zsh
    rm ~/.zshrc

    echo "...linking ~/.zsh and ~/.zshrc"
    ln -s $basedir ~/.zsh
    ln -s $basedir ~/.zshrc
else
    echo "...removing previous configuration"
    rm ~/.zshrc

    echo "...linking ~/.zshrc"
    ln -s $basedir ~/.zshrc
fi

echo "...creating ~/.zsh/local/zshrc for local customizations"
echo '# automatically sourced from ~/.zshrc, add your local customizations here.' > ~/.zsh/local/zshrc

echo "...done!"
