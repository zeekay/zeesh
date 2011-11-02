#!/bin/sh
rm ~/.zshrc
ln -s ~/.zsh/zshrc ~/.zshrc
echo '# Automatically sourced from ~/.zshrc, add your local customizations here.' > ~/.zsh/local/zshrc
