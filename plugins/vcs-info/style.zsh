zstyle ':vcs_info:*' disable cdv cvs darcs fossil mtn p4 svk tla
zstyle ':vcs_info:*' enable hg git svn
zstyle ':vcs_info:hg*:*' get-bookmarks true
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' check-for-changes true

zstyle ':vcs_info:*:*' unstagedstr $VCS_INFO_UNSTAGED_FMT
zstyle ':vcs_info:*:*' stagedstr $VCS_INFO_STAGED_FMT
zstyle ':vcs_info:*:*' branchformat $VCS_INFO_BRANCH_FMT
zstyle ':vcs_info:hg*' hgrevformat $VCS_INFO_HG_REV_FMT
zstyle ':vcs_info:hg*' formats $VCS_INFO_HG_FMT
zstyle ':vcs_info:hg*' actionformats $VCS_INFO_HG_ACTION_FMT
zstyle ':vcs_info:git*' formats $VCS_INFO_GIT_FMT
zstyle ':vcs_info:git*' actionformats $VCS_INFO_GIT_ACTION_FMT

# use-simple reduces hg overhead but doesn't show dirty or local rev numbers
# zstyle ':vcs_info:hg*:*' use-simple true
# zstyle ':vcs_info:hg*:*' hgrevformat "%10.10h"

### Hooks
# hg: Style bookmarks
+vi-hg-bookmarks() {
    local s i
    # The bookmarks returned by `hg' are available in
    # the functions positional parameters.
    for i in "$@"; do
        # I frequently use hg-git, which creates a master bookmark, I'd prefer for that to be ignored
        if [[ $i != "master" ]]; then
            [[ -n $s ]] && s=$s,
            s=${s}$i
        fi
    done
    # tiny styling tweak when bookmark exists
    [[ -n $s ]] && s=/$s
    hook_com[hg-bookmark-string]=$s
    ret=1
    return 0
}

# hg: Time since last commit
+vi-hg-time-since() {
    local now=`date +%s`
    local last=$now

    if [ -f "$hook_com[base]/.hg/undo.dirstate" ]; then
        local last=`last-modified $hook_com[base]/.hg/undo.dirstate`
    fi

    local since=$(( $now - $last ))
    if [[ $since -lt 3600 ]]; then
        since=$(( $since / 60 ))m
    elif [[ $since -lt 86400 ]]; then
        since=$(( $since / 3600 ))h
    else
        since=$(( $since / 86400 ))d
    fi

    # jam time-since in front of branch
    hook_com[vcs]=$since
}

# git: Time since last commit
+vi-git-time-since() {
    local now=`date +%s`
    local last="`echo $(git log --pretty=format:'%at' -1 2>&1)`"

    if [[ "$last" =~ "^[0-9]+$" ]]; then
        local since=$(( $now - $last ))
        if [[ $since -lt 3600 ]]; then
            since=$(( $since / 60 ))m
        elif [[ $since -lt 86400 ]]; then
            since=$(( $since / 3600 ))h
        else
            since=$(( $since / 86400 ))d
        fi

        # jam time-since in front of branch
        hook_com[vcs]=$since
    fi
}

# hg: Show marker when the working directory is not on a branch head.
# The cache/branchheads file is not updated with every Mercurial
# operation, so it will sometimes give false positives. An example of a case
# where the report may be incorrect is immediately after a commit. An easy
# and relatively low cost solution is to make a post-commit hook that calls
# hg summary on the repository, updating the cache. For example, in your
# global hgrc, simply include something like:
#
# [hooks]
# post-commit = hg summary >/dev/null
#
+vi-hg-storerev() {
    # The hash is available in the hgrev-format hook, store a copy of it in the
    # user_data array so we can access it in the second function
    user_data[hash]=${hook_com[hash]}
}

+vi-hg-branchhead() {
    local branchheadsfile i_tiphash i_branchname
    local -a branchheads

    local branchheadsfile=${hook_com[base]}/.hg/cache/branchheads

    # Bail out if any mq patches are applied
    [[ -s ${hook_com[base]}/.hg/patches/status ]] && return 0

    if [[ -r ${branchheadsfile} ]] ; then
        while read -r i_tiphash i_branchname ; do
            branchheads+=( $i_tiphash )
        done < ${branchheadsfile}

        if [[ ! ${branchheads[(i)${user_data[hash]}]} -le ${#branchheads} ]] ; then
            hook_com[revision]="!${hook_com[revision]}"
        fi
    fi
}

+vi-git-aheadbehind() {
    local ahead behind
    local -a gitstatus

    ahead=$(command git rev-list ${hook_com[branch]}@{upstream}..HEAD --count 2>/dev/null)
    behind=$(command git rev-list HEAD..${hook_com[branch]}@{upstream} --count 2>/dev/null)

    (( $ahead )) && gitstatus+=( "⇡$ahead" )
    (( $behind )) && gitstatus+=( "⇣$behind" )
    (( $ahead || $behind )) && gitstatus+=' '

    hook_com[misc]+=${(j::)gitstatus}
}

zstyle ':vcs_info:hg*+gen-hg-bookmark-string:*' hooks hg-bookmarks
zstyle ':vcs_info:hg*+set-hgrev-format:*' hooks hg-storerev
zstyle ':vcs_info:hg*+set-message:*' hooks hg-branchhead hg-time-since
zstyle ':vcs_info:git*+set-message:*' hooks git-time-since

# Uncomment for verbose debugg info
# zstyle ':vcs_info:*+*:*' debug true

# vim: ft=zsh
