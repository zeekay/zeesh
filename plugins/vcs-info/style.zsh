zstyle ':vcs_info:*' enable hg git svn
zstyle ':vcs_info:hg*:*' get-bookmarks true
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' check-for-changes true

# simple
zstyle ':vcs_info:hg*:' use-simple true
zstyle ':vcs_info:hg*' formats "%b:%i%m%u"
zstyle ':vcs_info:hg*' actionformats "%b:%i%m%u"
zstyle ':vcs_info:git*' formats "%12.12i%u:%b%m"
zstyle ':vcs_info:git*' actionformats "%12.12i%u:%b%m"

# # complex
# zstyle ':vcs_info:hg*:' use-simple false
# zstyle ':vcs_info:hg*' formats "(%s)[%i:%b%m%u]"
# zstyle ':vcs_info:hg*' actionformats "(%s|%a)[%i:%b%m%u]"
# zstyle ':vcs_info:git*' formats "(%s)[%12.12i%u:%b%m]"
# zstyle ':vcs_info:git*' actionformats "(%s|%a)[%12.12i%u:%b%m]"

#zstyle ':vcs_info:hg*:*' get-mq true
#zstyle ':vcs_info:hg*:*' get-unapplied true
#zstyle ':vcs_info:hg*:*' patch-format "mq(%g):%n/%c%p"
#zstyle ':vcs_info:hg*:*' nopatch-format "mq(%g):%n/%c%p"

zstyle ':vcs_info:hg*:*' unstagedstr "+"
zstyle ':vcs_info:hg*:*' hgrevformat "%r" # only show local rev.
zstyle ':vcs_info:hg*:*' branchformat "%b" # only show branch

zstyle ':vcs_info:hg+set-hgrev-format:*' hooks hg-storerev
zstyle ':vcs_info:hg+set-message:*' hooks hg-branchhead
