#!/bin/sh

# get first character of string, lowercase
first_char() {
    echo $1 | cut -c 1 | tr '[A-Z]' '[a-z]'
}

# read user input
ask() {
    question="$1"
    default="$2"

    echo "$question (yes/no default: $default) \c"

    read answer </dev/tty

    # get first char of answer or default
    if [ "$answer" = "" ]; then
        answer=`first_char $default`
    else
        answer=`first_char $answer`
    fi

    if [ $answer = y ]; then
        return 0
    else
        return 1
    fi
}

backup() {
    original="$1"
    backup="$original.bak"
    name="`basename $original`"

    # check for broken symlinks
    if [ "`find -L $original -maxdepth 0 -type l 2>/dev/null`" != "" ]; then
        echo "rm ~/$name (broken link to `readlink $original`)"
        rm $original
        return
    fi

    if [ -e "$original" ]; then
        if [ -e "$backup" ]; then
            n=1
            while [ -e "$backup.$n" ]; do
                (( n ++ ))
            done
            backup="$backup.$n"
        fi

        echo "mv ~/$name $backup"
        mv "$original" "$backup"
    fi
}

install_zshrc() {
    backup $HOME/.zshrc

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

    cat > $HOME/.zshrc << EOF
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
}

git_clone() {
    git clone --depth 1 "$1" "$2" 2>&1 | grep 'Cloning into'
}

backup $HOME/.zsh
git_clone https://github.com/zeekay/zeesh $HOME/.zsh

if [ -z "$ELLIPSIS_INSTALL" ]; then
    ask "Create default zshrc?" "no" && install_zshrc
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
