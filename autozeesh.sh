#!/bin/sh

echo ":: zeesh installation script v1.0 ::"

hg clone https://bitbucket.org/zeekay/dot-zsh ~/.zsh
. ~/.zsh/setup.sh

echo 'Installation complete.'
echo '                             __ '
echo '                     __     / /'
echo ' ____  ____ ___ ____/ /_   / /'
echo '/_  / / __/ __// __/ __ \ /_/'
echo ' / /_/ __/ __/_\ \  / / /__ '
echo '/___/___/___/____/_/ /_/__/'
echo 
echo
echo '....is now installed.'
exec zsh
