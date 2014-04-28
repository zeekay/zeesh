# Legacy version of vi-statusline with proper
# vcs info formatting on zsh <5.0.

VIRTUAL_ENV_DISABLE_PROMPT=true

if [ $zeesh_plugins[vcs-info] ]; then
    VCS_INFO_BRANCH_FMT='%b'
    VCS_INFO_STAGED_FMT='+'
    VCS_INFO_UNSTAGED_FMT='!'
    VCS_INFO_TIMESINCE_FMT='$s'

    VCS_INFO_GIT_ACTION_FMT='%F{magenta}‹%s %b%m %0.10i%c%u %a›%f'
    VCS_INFO_GIT_FMT='%F{magenta}‹%s %b%m %0.10i%c%u›%f'

    VCS_INFO_HG_ACTION_FMT='%F{magenta}‹%s %b%m %i%c%u %a›%f'
    VCS_INFO_HG_FMT='%F{magenta}‹%s %b%m %i%c%u›%f'

    VCS_INFO_HG_BOOKMARK_FMT=''
    VCS_INFO_HG_REV_FMT='%r'

    source ~/.zsh/plugins/vcs-info/style.zsh
fi

export ZEESH_THEME_NORMAL_CHAR=
export ZEESH_THEME_VISUAL_CHAR=
export ZEESH_THEME_INSERT_CHAR=
# export ZEESH_THEME_NORMAL_CHAR_R=‹normal›
# export ZEESH_THEME_VISUAL_CHAR_R=‹visual›
# export ZEESH_THEME_INSERT_CHAR_R=‹insert›
export ZEESH_THEME_PROMPT_CHAR=›

_prompt() {
    local mode=
    case $KEYMAP in
        vicmd)
            mode=$ZEESH_THEME_NORMAL_CHAR
        ;;
        vivis)
            mode=$ZEESH_THEME_VISUAL_CHAR
        ;;
        *)
            mode=$ZEESH_THEME_INSERT_CHAR
        ;;
    esac

    local s="%F{magenta}%B%n%b%f%F{magenta}@%f%F{magenta}%B%m%f%b %F{blue}%B${PWD/$HOME/~}%b%f"

    # display vcs info
    if [ "$vcs_info_msg_0_" ]; then
        s="$s $vcs_info_msg_0_"
    fi

    # print virtualenv name if active
    if [ $VIRTUAL_ENV ]; then
        s="$s %F{magenta}‹${${(s:/:)VIRTUAL_ENV}[-1]}›%f "
    fi

    echo -e "$s%F{magenta} $mode$ZEESH_THEME_PROMPT_CHAR%f "
}

_rprompt() {
    # print return code if non-zero
    local rc=$?

    if [[ $rc != 0 ]]; then
        local s="%F{red}% $(emoticon) $rc!%f"
    fi

    echo -e $s
}

PROMPT='$(_prompt)'
RPROMPT='$(_rprompt)'

zle-keymap-select() {
    zle reset-prompt
}
zle -N zle-keymap-select

zle-line-init() {
    zle reset-prompt
}
zle -N zle-line-init
