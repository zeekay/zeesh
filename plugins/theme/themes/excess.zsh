VIRTUAL_ENV_DISABLE_PROMPT=true
FIRST_PROMPT=true

if [ $zeesh_plugins[vcs-info] ]; then
    VCS_INFO_UNSTAGED_FMT='+'
    VCS_INFO_STRAGED_FMT='^'
    VCS_INFO_BRANCH_FMT='%b'
    VCS_INFO_HGREV_FMT='%r'
    VCS_INFO_HGBOOKMARK_FMT=''
    VCS_INFO_TIMESINCE_FMT=' $s'
    VCS_INFO_HG_FMT='on %F{magenta}%b%m%f at %F{magenta}%i%u%f'
    VCS_INFO_GIT_FMT='on %F{magenta}%b%m%f at %F{magenta}%10.10i%u%f'
    VCS_INFO_HGACTION_FMT='%F{magenta}%a%f on %F{magenta}%b%m%f at %F{magenta}%i%u%f'
    VCS_INFO_GITACTION_FMT='%F{magenta}%a%f on %F{magenta}%b%m%f at %F{magenta}%10.10i%u%f'
    source ~/.zsh/plugins/vcs-info/style.zsh
fi

_prompt() {
    local s="%B%F{magenta}%n%f%b at %B%F{magenta}%m%f%b in %F{blue}%B${PWD/$HOME/~}%b%f"

    # print virtualenv name if active
    if [ $VIRTUAL_ENV ]; then
        s="$s %K{black}${${(s:/:)VIRTUAL_ENV}[-1]}%k"
    fi

    # display vcs info
    if [ "$vcs_info_msg_0_" ]; then
        s="$s $vcs_info_msg_0_"
    fi

    # display newline after prompt
    if [ $FIRST_PROMPT ]; then
        unset FIRST_PROMPT
        echo -e "$s"
    else
        echo -e "\n$f"
    fi
}

_rprompt() {
    # print return code if non-zero
    local rc=$?
    if [[ $rc != 0 ]]; then
        s="%F{red}$rc!%f"
    fi
    echo -e $s
}

PROMPT='$(_prompt)
> '
RPROMPT='$(_rprompt)'
