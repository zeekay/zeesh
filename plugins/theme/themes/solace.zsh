export VIRTUAL_ENV_DISABLE_PROMPT=true

_rprompt() {
    s=''

    # print return code if non-zero
    rc=$?
    if [[ $rc != 0 ]]; then
        s="%F{red}$rc!%f"
    fi

    # print virtualenv name if active
    if [ $VIRTUAL_ENV ]; then
        s="$s %K{black}${${(s:/:)VIRTUAL_ENV}[-1]}%k"
    fi

    # display vcs info
    if [ "$vcs_info_msg_0_" ]; then
        s="$s %K{black}$vcs_info_msg_0_%k"
    fi
    echo -e $s
    unset rc s
}

PROMPT='%B%F{magenta}%n%b%f%F{magenta}@%f%B%F{magenta}%m%b%f %F{blue}%B${PWD/$HOME/~}%b%F{magenta} %#%f '
RPROMPT='$(_rprompt)'
