export VIRTUAL_ENV_DISABLE_PROMPT=true

_prompt() {
    s=''

    # print virtualenv name if active
    if [ $VIRTUAL_ENV ]; then
        s="$s %K{black}${${(s:/:)VIRTUAL_ENV}[-1]}%k"
    fi

    # display vcs info
    if [ "$vcs_info_msg_0_" ]; then
        s="$s %K{black}$vcs_info_msg_0_%k"
    fi

    echo -e $s
    unset s
}

_rprompt() {
    rc=$?
    if [[ $rc != 0 ]]; then
        echo -e "%F{red}$rc!%f"
    fi
    unset rc
}

PROMPT='%B%F{magenta}%n%f%b on %B%F{magenta}%m%f%b in %F{blue}%B${PWD/$HOME/~}%b$(_prompt)
%#%f '
RPROMPT='$(_rprompt)'
