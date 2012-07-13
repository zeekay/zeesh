# zeesh!
My zsh config. More of a framework, really. Usable stand-alone
or with [ellipsis](https://github.com/zeekay/ellipsis).

## Install
Clone and run `setup.sh` or install as part of
[ellipsis](https://github.com/zeekay/ellipsis). One-liner for the lazy:

    git clone https://github.com/zeekay/dot-zsh ~/.zsh && ~/.zsh/setup.sh

Customize ~/.zshrc with the plugins you intend to enable:

    zeesh_plugins=( autocomplete vim vi-mode vi-visual-mode osx vcs-info theme
    history-substring-search syntax-highlighting) source ~/.zsh/zeesh.zsh

## Customization
You can enable/disable various features using
plugins. `ls ~/.zsh/plugins` for a list of plugins.
