VIRTUAL_ENV_DISABLE_PROMPT=true

if [ $zeesh_plugins[vcs-info] ]; then
    VCS_INFO_BRANCH_FMT='%b'

    VCS_INFO_GIT_ACTION_FMT='%F{magenta}%b%m@%0.10i%c%u %a%f'
    VCS_INFO_GIT_FMT='%F{magenta}%b%m@%0.10i%c%u%f'

    VCS_INFO_HG_ACTION_FMT='%F{magenta}%b%m@%i%c%u %a%f'
    VCS_INFO_HG_FMT='%F{magenta}%b%m@%i%c%u%f'

    VCS_INFO_HG_BOOKMARK_FMT=''
    VCS_INFO_HG_REV_FMT='%r'

    VCS_INFO_STAGED_FMT='+'
    VCS_INFO_UNSTAGED_FMT='!'
    VCS_INFO_TIMESINCE_FMT='$s'

    source ~/.zsh/plugins/vcs-info/style.zsh
fi

_prompt() {
    echo -e "%F{magenta}%B%n%b%f%F{magenta}@%f%F{magenta}%B%m%f%b%F{magenta}›%f "
}

_rprompt() {
    local rc=$?
    local s=""

    # print return code if non-zero
    if [[ $rc != 0 ]]; then
        rc="$rc"!
        s="%F{red}% $rc$(emoticon) %f"
    fi

    # print virtualenv name if active
    if [ $VIRTUAL_ENV ]; then
        s="$s%F{magenta}${${(s:/:)VIRTUAL_ENV}[-1]}%f:"
    fi

    # print path
    s="$s%F{blue}%B${PWD/$HOME/~}%b%f"

    # display vcs info
    if [ "$vcs_info_msg_0_" ]; then
        s="$s $vcs_info_msg_0_"
    fi

    echo -e $s
}

PROMPT='$(_prompt)'
RPROMPT='$(_rprompt)'
