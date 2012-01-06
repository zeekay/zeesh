export VIRTUAL_ENV_DISABLE_PROMPT=true
export VCS_INFO_UNSTAGED_FMT='+'
export VCS_INFO_STRAGED_FMT='^'
export VCS_INFO_BRANCH_FMT='%b'
export VCS_INFO_HGREV_FMT='%r'
export VCS_INFO_HGBOOKMARK_FMT=''
export VCS_INFO_TIMESINCE_FMT=' $s'
export VCS_INFO_HG_FMT='%b%m@%i%u'
export VCS_INFO_HGACTION_FMT='%b%m@%i%u'
export VCS_INFO_GIT_FMT='%b%m@%10.10i%u'
export VCS_INFO_GITACTION_FMT='%b%m@%10.10i%u'

function zle-line-init zle-keymap-select {
        PR_VIMODE="${${KEYMAP/vicmd/:}/(main|viins)/%%}"
        PR_VICOLOR="${${KEYMAP/vicmd/%B%F{magenta}}/(main|viins)/%B%F{black}}"
        zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

_prompt() {
    local s="%B%F{magenta}%n%f%b on %B%F{magenta}%m%f%b in %F{blue}%B${PWD/$HOME/~}%b"

    # print virtualenv name if active
    if [ $VIRTUAL_ENV ]; then
        s="$s %K{black}${${(s:/:)VIRTUAL_ENV}[-1]}%k"
    fi

    # display vcs info
    if [ "$vcs_info_msg_0_" ]; then
        s="$s $vcs_info_msg_0_"
    fi

    echo -e $s
}

_rprompt() {
    local rc=$?
    if [[ $rc != 0 ]]; then
        echo -e "%F{red}$rc!%f"
    fi
}

PROMPT='$(_prompt)
${PR_VIMODE} '
RPROMPT='$(_rprompt)'
