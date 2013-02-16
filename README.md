# zeesh!
                                 __
                         __     / /
     ____  ____ ___ ____/ /_   / /
    /_  / / __/ __// __/ __ \ /_/
     / /_/ __/ __/_\ \  / / /__
    /___/___/___/____/_/ /_/__/

...is a cross-platform zsh framework. It's similar to, but incompatible with,
[oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh). It has a modular plugin
architecture, and it's easy to extend. It has a rich set of defaults, but is
designed to be as lightweight as possible.

## Installation
Clone into ~/.zsh and source ~/.zsh/zeesh, or use the install script:

    curl https://raw.github.com/zeekay/zeesh/master/install.sh | sh

## Configuration
You can enable/disable various features using
plugins. `ls ~/.zsh/plugins` for a list of plugins. A basic configuration looks
something like:

    zeesh_plugins=(
        autocomplete
        osx
        git
        vcs-info
        syntax-highlighting
        history-substring-search
        theme
        vi-mode
        vi-visual-mode
    )

    source ~/.zsh/zeesh.zsh
