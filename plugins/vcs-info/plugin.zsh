# this plugin enables vcs_info for zsh
autoload -Uz vcs_info

source ~/.zsh/plugins/vcs-info/style.zsh

# Call vcs_info as precmd before every prompt.
vcs-prompt-precmd() {
    vcs_info
}
add-zsh-hook precmd vcs-prompt-precmd

# Must run vcs_info when changing directories.
vcs-prompt-chpwd() {
    FORCE_RUN_VCS_INFO=1
}
add-zsh-hook chpwd vcs-prompt-chpwd

setopt TRANSIENT_RPROMPT
RPROMPT='${vcs_info_msg_0_}'
