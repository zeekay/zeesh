dot-zsh
=======
My ZSH config, not for the faint of the heart. More of a framework, really. "Zeesh! Why would you want to do that?!" Usable stand-alone or part of my [dotfiles](https://github.com/zeekay/dotfiles) framework.

Install
-------
Clone and run `setup.sh` or install as part of [dotfiles](https://github.com/zeekay/dotfiles):

    git clone https://github.com/zeekay/dot-zsh ~/.vim && ~/.zsh/setup.sh

Customize ~/.zshrc with the plugins you intend to enable:

    zeesh_plugins=(
        # enable autocompletion
        autocomplete

        # vim keybindings
        vi-mode
        vi-visual-mode

        # platform specific customizations
        osx

        # vcs support
        vcs-info

        # enable themes
        theme

        # nicer command line life
        history-substring-search
        syntax-highlighting
    )
    source ~/.zsh/zeesh.zsh

Customization
-------------
You can enable/disable various features using plugins. Do `ls ~/.zsh/plugins` for a list of plugins.
