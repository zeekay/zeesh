#!/bin/sh

backup() {
    original="$1"
    backup="$original.bak"
    name="`basename $original`"

    if [ -e "$original" ]; then
        echo "Backing up $name"

        if [ -e "$backup" ]; then
            n=1
            while [ -e "$backup.$n" ]; do
                (( n ++ ))
            done
            backup="$backup.$n"
        fi
        mv "$original" "$backup"
    fi
}

# backup ~/.zsh if necessary
backup "$HOME/.zsh"

# clone zeesh to ~/.zsh
git clone https://github.com/zeekay/zeesh $HOME/.zsh

echo "Install skeleton ~/.zshrc? (y/n) \c"
read input </dev/tty

if [ "$input" = "y" ]; then
    backup "$HOME/.zshrc"

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
