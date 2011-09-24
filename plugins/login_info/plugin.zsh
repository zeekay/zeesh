# login_info zeesh plugin
if [[ -o interactive ]]; then
    DOTFILE_VERSION=$(hg id -n .)
    # check if using color-switch or oh-my-zsh
    if [[ -n $COLOR_SWITCH_THEME && -n $OH_MY_ZSH_THEME ]]; then
        local theme_msg=":: $COLOR_SWITCH_THEME / $OH_MY_ZSH_THEME"
    elif  [ -n "$COLOR_SWITCH_THEME" ]; then
        local theme_msg=":: $COLOR_SWITCH_THEME"
    elif  [ -n "$OH_MY_ZSH_THEME" ]; then
        local theme_msg=":: $OH_MY_ZSH_THEME"
    else
        local theme_msg=""
    fi

    echo "\e[1mzsh $ZSH_VERSION :: zeesh $DOTFILE_VERSION $theme_msg\e[0m"
fi
