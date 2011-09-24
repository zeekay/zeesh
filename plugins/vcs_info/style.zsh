# rev+changes branch misc
zstyle ':vcs_info:hg*' formats "(%s)[%i:%b%m%u]"
zstyle ':vcs_info:hg*' actionformats "(%s|%a)[%i:%b%m%u]"

# hash changes branch misc
zstyle ':vcs_info:git*' formats "(%s)[%12.12i%u:%b%m]"
zstyle ':vcs_info:git*' actionformats "(%s|%a)[%12.12i%u:%b%m]"

#zstyle ':vcs_info:hg*:*' get-mq true
#zstyle ':vcs_info:hg*:*' get-unapplied true
#zstyle ':vcs_info:hg*:*' patch-format "mq(%g):%n/%c%p"
#zstyle ':vcs_info:hg*:*' nopatch-format "mq(%g):%n/%c%p"

zstyle ':vcs_info:hg*:*' unstagedstr "+"
zstyle ':vcs_info:hg*:*' hgrevformat "%r" # only show local rev.
zstyle ':vcs_info:hg*:*' branchformat "%b" # only show branch

zstyle ':vcs_info:hg+set-hgrev-format:*' hooks hg-storerev
zstyle ':vcs_info:hg+set-message:*' hooks hg-branchhead
