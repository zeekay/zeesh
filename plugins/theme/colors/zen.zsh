VIRTUAL_ENV_DISABLE_PROMPT=true

export ZEESH_THEME_NORMAL_CHAR='\n'
export ZEESH_THEME_VISUAL_CHAR='\n'
export ZEESH_THEME_INSERT_CHAR='\n'
export ZEESH_THEME_PROMPT_CHAR=''

# Git info function - always available
_git_info() {
    # Check if in git repo
    git rev-parse --is-inside-work-tree &>/dev/null || return

    local branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
    # Get latest properly-formatted semver tag (filters malformed tags)
    local tag=$(git tag --sort=-v:refname 2>/dev/null | grep -E '^(v[0-9]|[a-z]+-v[0-9])' | head -1)
    local dirty=""
    local staged=""
    local ahead_behind=""

    # Check for uncommitted changes
    [[ -n $(git status --porcelain 2>/dev/null | grep -v '^??') ]] && dirty="!"
    # Check for staged changes
    [[ -n $(git diff --cached --name-only 2>/dev/null) ]] && staged="+"

    # Check ahead/behind
    local upstream=$(git rev-parse --abbrev-ref @{upstream} 2>/dev/null)
    if [[ -n "$upstream" ]]; then
        local ahead=$(git rev-list --count @{upstream}..HEAD 2>/dev/null)
        local behind=$(git rev-list --count HEAD..@{upstream} 2>/dev/null)
        [[ $ahead -gt 0 ]] && ahead_behind+="⇡$ahead"
        [[ $behind -gt 0 ]] && ahead_behind+="⇣$behind"
    fi

    local info="$branch$staged$dirty"
    [[ -n "$ahead_behind" ]] && info+=" $ahead_behind"
    [[ -n "$tag" ]] && info+=" @$tag"

    echo "%F{green}‹$info›%f"
}

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

    local s="%F{green}%n@%m%f %F{blue}${PWD/$HOME/~}%f"

    # display git info
    local gitinfo=$(_git_info)
    if [[ -n "$gitinfo" ]]; then
        s="$s $gitinfo"
    fi

    # print virtualenv name if active
    if [[ -n $VIRTUAL_ENV ]]; then
        s="$s %F{green}‹${${(s:/:)VIRTUAL_ENV}[-1]}›%f "
    fi

    echo -e "$s%F{green} $mode$ZEESH_THEME_PROMPT_CHAR%f"
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
