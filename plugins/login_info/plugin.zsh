# login_info zeesh plugin
if [[ -o interactive ]]; then
    versions=(`~/.dot-files/version.sh`)
    in_array zeesh_plugins themes && theme=`cat .zsh/local/theme.last`
    if [ $theme ]; then
        echo "\e[1mzsh $ZSH_VERSION :: $versions :: $theme\e[0m"
    else
        echo "\e[1mzsh $ZSH_VERSION :: $versions\e[0m"
    fi
fi
