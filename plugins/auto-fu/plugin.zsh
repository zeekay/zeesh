### auto-fu / zeesh! plugin

# install
if [ -f ~/.zsh/plugins/auto-fu/lib/auto-fu.zsh ]; then
    source ~/.zsh/plugins/auto-fu/auto-fu; auto-fu-install;
    zstyle ':auto-fu:highlight' input bold
    zstyle ':auto-fu:highlight' completion fg=black,bold
    zstyle ':auto-fu:highlight' completion/one fg=white,bold,underline
    zstyle ':auto-fu:var' postdisplay $'\n-azfu-'
    zstyle ':auto-fu:var' track-keymap-skip opp
    zle-line-init () {auto-fu-init;}; zle -N zle-line-init
    zle -N zle-keymap-select auto-fu-zle-keymap-select
else
    # install auto-fu if it's missing
    echo -n "I can't find auto-fu.zsh, would you like me to install it for you? (y/n) "
    read ans
    if [[ "$ans" == "y" ]]; then
        git clone git://github.com/hchbaw/auto-fu.zsh.git ~/.zsh/plugins/auto-fu/lib
        source ~/.zsh/plugins/auto-fu/lib/auto-fu.zsh
        auto-fu-zcompile ~/.zsh/plugins/auto-fu/lib/auto-fu.zsh ~/.zsh/plugins/auto-fu/ > /dev/null 2>&1
        echo "...installed auto-fu!"
        reload
    fi
fi
