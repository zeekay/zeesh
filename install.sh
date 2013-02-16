#!/bin/bash
for f in zsh zshrc; do
    if [ -e "$HOME/.$f" ]; then
        echo "...backing up ~/.$f"

        if [ -e "$HOME/.$f.bak" ]; then
            # append number to end of backups
            n = 1
            while [ -e "$HOME/.$f.bak.$n" ]; do
                (( n ++ ))
            done
            mv "$HOME/.$f" "$HOME/.$f.bak.$n"
        else
            mv "$HOME/.$f" "$HOME/.$f.bak"
        fi
    fi
done

git clone https://github.com/zeekay/zeesh $HOME/.zsh
echo -n "install skeleton ~/.zshrc? (y/n) "
read input
if [ "$input" = "y" ]; then
    platform=`uname | tr [A-Z] [a-z]`
    case $platform in
        darwin)
            platform='osx    '
        ;;
        freebsd)
            platform='freebsd'
        ;;
        linux)
            platform='linux  '
        ;;
        cygwin*)
            platform='cygwin '
        ;;
    esac

    cat > ~/.zshrc << EOF
zeesh_plugins=(
    autocomplete
    $platform
    git
    vcs-info
    syntax-highlighting
    history-substring-search
    theme
    vi-mode
    vi-visual-mode
)
source ~/.zsh/zeesh.zsh
EOF

fi

cat << EOF
Installation complete.
                             __
                     __     / /
 ____  ____ ___ ____/ /_   / /
/_  / / __/ __// __/ __ \ /_/
 / /_/ __/ __/_\ \  / / /__
/___/___/___/____/_/ /_/__/

...is now installed.
EOF
