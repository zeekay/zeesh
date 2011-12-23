# theme

autoload colors; colors;

theme() {
    if [ $1 ]; then
        if [ -f ~/.zsh/plugins/theme/themes/$1.zsh ]; then
            source ~/.zsh/plugins/theme/themes/$1.zsh
            if [ -f ~/.zsh/local/theme.last ]; then
                rm ~/.zsh/local/theme.last
            fi
            echo $1 > ~/.zsh/local/theme.last
        else
            echo "Can't find that theme"
        fi
    else
        typeset -A assoc; assoc=$(ls ~/.zsh/plugins/theme/themes | cut -d . -f1)
        LAST_THEME=$(cat ~/.zsh/local/theme.last | sed -e 's/^[ \t]*//')
        NEW_THEME=${assoc[(wr)^(current|$LAST_THEME)]}
        echo -e "Last theme: $LAST_THEME, switching to: $NEW_THEME"
        source ~/.zsh/plugins/theme/themes/$NEW_THEME.zsh
        if [ -f ~/.zsh/local/theme.last ]; then
            rm ~/.zsh/local/theme.last
        fi
        echo $NEW_THEME > ~/.zsh/local/theme.last
    fi
}

_list_themes() {
    reply=(`ls ~/.zsh/plugins/theme/themes | cut -d . -f1`)
}

# theme completion
compctl -K _list_themes theme

# Load last theme
if [ -f ~/.zsh/local/theme.last ]; then
    local theme=$(cat ~/.zsh/local/theme.last | sed -e 's/^[ \t]*//')
    source ~/.zsh/plugins/theme/themes/$theme.zsh
fi
