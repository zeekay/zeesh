export VIRTUAL_ENV_DISABLE_PROMPT=true
setopt PROMPT_SUBST

ve() {
    [ $VIRTUAL_ENV ] && echo -e " %K{black}${${(s:/:)VIRTUAL_ENV}[-1]}%k"
}

rc() {
    rc=$?
    [[ $rc != 0 ]] && echo -e "%F{red}$rc!%f "
}

is_vcs() {
    [ -d "`pwd`/.hg" ] || [ -d "`pwd`/.git" ] && return 0
    return 1
}

PROMPT='%B%F{magenta}%n%b%f%F{magenta}@%f%B%F{magenta}%m%b%f %F{blue}%B${PWD/$HOME/~}%b%F{magenta} %#%f '
RPROMPT='$(rc)$(ve)`is_vcs && echo -e " %K{black}${vcs_info_msg_0_}%k"`'
