# this plugin enables vcs_info for zsh
autoload -Uz vcs_info

source ~/.zsh/plugins/vcs_info/style.zsh

# Call vcs_info as precmd before every prompt.
_vcs_prompt_precmd() {
    vcs_info
}
add-zsh-hook precmd _vcs_prompt_precmd

# Must run vcs_info when changing directories.
_vcs_prompt_chpwd() {
    FORCE_RUN_VCS_INFO=1
}
add-zsh-hook chpwd _vcs_prompt_chpwd

setopt TRANSIENT_RPROMPT
RPROMPT='${vcs_info_msg_0_}'
