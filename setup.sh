#!/bin/sh
echo "zeesh! installation script"

# if setup is run from dot-files/setup.sh use basedir provided
if [ "$repo_basedir" ]; then
    basedir=$repo_basedir
else
    basedir="$( cd -P "$( dirname "$0" )" && pwd )"
fi

# remove previous configuration and link to destination if not cloned directly there
if [ "$basedir" != "$HOME/.zsh" ]; then
    echo "...removing previous configuration"
    rm -rf ~/.zsh

    echo "...linking ~/.zsh and ~/.zshrc"
    ln -s $basedir ~/.zsh
fi

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
    # platform-specific
    $platform

    # python funcs/aliases
    # python

    # virtualenv wrapper
    # virtualenv

    # mercurial func/aliases
    # mercurial

    # django func/aliases
    # django

    # wrapper for virtualbox
    # virtualbox

    # provides command line vcs info
    # vcs-info

    # cli syntax highlighting
    # syntax-highlighting

    # search history from substring
    # history-substring-search

    # themes
    # theme

    # enables autocompletion
    autocomplete

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
