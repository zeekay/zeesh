export VIRTUAL_ENV_DISABLE_PROMPT=true
setopt PROMPT_SUBST

ve(){
    [ $VIRTUAL_ENV ] && echo -e "%F{black}(%F{magenta}${${(s:/:)VIRTUAL_ENV}[-1]}%F{black})%f"
}

rc(){
    rc=$?
    [[ $rc != 0 ]] && echo %F{red}$rc!%f
}

is_vcs(){
    [ -d "`pwd`/.hg" ] || [ -d "`pwd`/.git" ] && return 0
    return 1
}

PROMPT='%B%F{magenta}%n%f%b on %B%F{magenta}%m%f%b in %F{blue}%B${PWD/$HOME/~}%b `is_vcs && echo -e %K{black}${vcs_info_msg_0_}%k`
$(ve)%F{magenta}%#%f '
RPROMPT='$(rc)'
