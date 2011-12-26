### auto-fu / zeesh! plugin

REPO='git://github.com/hchbaw/auto-fu.zsh.git'

# install
[ -f ~/.zsh/plugins/auto-fu/lib/auto-fu.zsh ] || . ~/.zsh/plugins/auto-fu/install.zsh && exit 1

source ~/.zsh/plugins/auto-fu/auto-fu; auto-fu-install;
zstyle ':auto-fu:highlight' input bold
zstyle ':auto-fu:highlight' completion fg=black,bold
zstyle ':auto-fu:highlight' completion/one fg=white,bold,underline
zstyle ':auto-fu:var' postdisplay $'\n-azfu-'
zstyle ':auto-fu:var' track-keymap-skip opp
zle-line-init () {auto-fu-init;}; zle -N zle-line-init
zle -N zle-keymap-select auto-fu-zle-keymap-select
