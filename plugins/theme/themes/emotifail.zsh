VIRTUAL_ENV_DISABLE_PROMPT=true

if [ $zeesh_plugins[vcs-info] ]; then
    VCS_INFO_UNSTAGED_FMT='+'
    VCS_INFO_STRAGED_FMT='^'
    VCS_INFO_BRANCH_FMT='%b'
    VCS_INFO_HGREV_FMT='%r'
    VCS_INFO_HGBOOKMARK_FMT=''
    VCS_INFO_TIMESINCE_FMT='$s'
    # VCS_INFO_HG_FMT='%F{magenta}‹%K{black}%s %b%m %i%u%k›%f'
    # VCS_INFO_HGACTION_FMT='%F{magenta}‹%K{black}%s %b%m %i%u %a%k›%f'
    # VCS_INFO_GIT_FMT='%F{magenta}‹%K{black}%s %b%m %10.10i%u%k›%f'
    # VCS_INFO_GITACTION_FMT='%F{magenta}‹%K{black}%s %b%m %10.10i%u %a%k›%f'
    VCS_INFO_HG_FMT='%F{magenta}‹%s %b%m %i%u›%f'
    VCS_INFO_HGACTION_FMT='%F{magenta}‹%s %b%m %i%u %a›%f'
    VCS_INFO_GIT_FMT='%F{magenta}‹%s %b%m %10.10i%u›%f'
    VCS_INFO_GITACTION_FMT='%F{magenta}‹%s %b%m %10.10i%u %a›%f'
    source ~/.zsh/plugins/vcs-info/style.zsh
fi

_prompt() {
    local s="%F{magenta}%B%n%b%f%F{magenta}@%f%F{magenta}%B%m%f%b %F{blue}%B${PWD/$HOME/~}%b%f"

    # display vcs info
    if [ "$vcs_info_msg_0_" ]; then
        s="$s $vcs_info_msg_0_"
    fi

    # split
    s="$s\n"

    # print virtualenv name if active
    if [ $VIRTUAL_ENV ]; then
        s="$s%F{magenta}${${(s:/:)VIRTUAL_ENV}[-1]}%f"
    fi

    echo -e "$s%F{magenta}›%f "
    # echo -e "$s%F{magenta}>%f "
}

_faces() {
    typeset -A faces
    faces[0]='ヽ(`皿′)ﾉ'
    faces[1]='(｀０´）'
    faces[2]='（ ｀´）'
    faces[3]='（。_°☆＼(- - )'
    faces[4]='(;・_・)'
    faces[5]='(-_-メ)'
    faces[6]='ヾ(･_･ )'
    faces[7]='(｡･_･｡)'
    faces[8]='（￣～￣）'
    faces[9]='( ´ ▽ ` )'
    faces[10]='（；_・）'
    faces[11]='（￣へ￣）'
    faces[12]='(;´ρ`)'
    faces[13]='☆⌒(＞。≪)'
    faces[14]='(´・｀)'
    faces[15]='(O_O；)'
    faces[16]='(。_゜)'
    faces[17]='(*・_・)ノ⌒*'
    faces[18]='(?・・)σ '
    faces[19]='(ﾟｰﾟ)(｡_｡)'
    faces[20]='ヾ(-_-;)'
    echo $faces[$[${RANDOM}%20]]
}

_rprompt() {
    # print return code if non-zero
    local rc=$?

    if [[ $rc != 0 ]]; then
        local s="%F{red}% $(_faces) $rc!%f"
    fi

    echo -e $s
}

PROMPT='$(_prompt)'
RPROMPT='$(_rprompt)'
