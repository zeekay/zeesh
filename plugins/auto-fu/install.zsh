### auto-fu / zeesh! plugin

REPO='git://github.com/hchbaw/auto-fu.zsh.git'

echo -n "I can't find auto-fu.zsh, would you like me to install it for you? (y/n) "
read ans
if [[ "$ans" == "y" ]]; then
    git clone git://github.com/hchbaw/auto-fu.zsh.git ~/.zsh/plugins/auto-fu/lib
    source ~/.zsh/plugins/auto-fu/lib/auto-fu.zsh
    auto-fu-zcompile ~/.zsh/plugins/auto-fu/lib/auto-fu.zsh ~/.zsh/plugins/auto-fu/ > /dev/null 2>&1
    echo "...installed auto-fu!"
    reload
fi
