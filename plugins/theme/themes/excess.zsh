VIRTUAL_ENV_DISABLE_PROMPT=true

if zeesh-plugin-enabled vcs-info; then
    export VCS_INFO_BRANCH_FMT='%b'

    export VCS_INFO_GIT_ACTION_FMT='%F{magenta}%a%f on %F{magenta}%b%m%f at %F{magenta}%0.10i%c%u %a%f'
    export VCS_INFO_GIT_FMT='on %F{magenta}%b%m%f at %F{magenta}%0.10i%c%u%f'

    export VCS_INFO_HG_ACTION_FMT='%F{magenta}%a%f on %F{magenta}%b%m%f at %F{magenta}%i%c%u %a%f'
    export VCS_INFO_HG_FMT='on %F{magenta}%b%m%f at %F{magenta}%i%c%u%f'

    export VCS_INFO_HG_REV_FMT='%r'
    export VCS_INFO_HG_BOOKMARK_FMT=''

    export VCS_INFO_STAGED_FMT='+'
    export VCS_INFO_UNSTAGED_FMT='!'
    export VCS_INFO_TIMESINCE_FMT=' $s'

    source ~/.zsh/plugins/vcs-info/style.zsh
fi

_prompt() {
    local s="%B%F{magenta}%n%f%b at %B%F{magenta}%m%f%b in %F{blue}%B${PWD/$HOME/~}%b%f"

    # display vcs info
    if [ "$vcs_info_msg_0_" ]; then
        s="$s $vcs_info_msg_0_"
    fi

    # display newline before prompt
    s="$s\n"

    # print virtualenv name if active
    if [ $VIRTUAL_ENV ]; then
        s="$s%K{black}${${(s:/:)VIRTUAL_ENV}[-1]}%k"
    fi

    echo -e "\n$s%F{magenta}>%f "
}

_rprompt() {
    # print return code if non-zero
    local rc=$?
    if [[ $rc != 0 ]]; then
        s="%F{red}$rc!%f"
    fi
    echo -e $s
}

PROMPT='$(_prompt)'
RPROMPT='$(_rprompt)'
