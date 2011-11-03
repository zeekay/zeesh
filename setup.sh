#!/bin/sh
echo "zeesh! installation script"

# if setup is run from dot-files/setup.sh use basedir provided
if [ "$repo_basedir" ]; then
    basedir=$repo_basedir
else
    basedir="$( cd -P "$( dirname "$0" )" && pwd )"
fi

# remove previous configuration and link to destination if not cloned directly there
if [ "$basedir" != "$home/.zsh" ]; then
    echo "...removing previous configuration"
    rm -rf ~/.zsh

    echo "...linking ~/.zsh and ~/.zshrc"
    ln -s $basedir ~/.zsh
fi

echo -n "install skeleton ~/.zshrc? (y/n) "
read input
if [ "$input" == "y" ]; then
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
    autocomplete                # enables on autocompletion
    $platform                     # platform-specific
    python                      # python funcs/aliases
    virtualenv                  # virtualenv wrapper
    mercurial                   # mercurial func/aliases
    django                      # django func/aliases
    virtualbox                  # wrapper for virtualbox
    vcs_info                    # provides command line vcs info
    syntax-highlighting         # cli syntax highlighting
    history-substring-search    # search history from substring
    theme                       # themes
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
