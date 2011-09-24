# this plugin enables vcs_info for zsh
autoload -Uz vcs_info
fpath=( ~/.zsh/plugins/vcs_info/func $fpath )
autoload -U ~/.zsh/plugins/vcs_info/func/*(:t)

# alias
alias vcs=_vcs_info_ctrl

# you can speed up vcs for large repos:
#zstyle ':vcs_info:hg*:hfcn' use-simple true

source ~/.zsh/plugins/vcs_info/style.zsh
zstyle ':vcs_info:*' enable none

# Call vcs_info as precmd before every prompt.
prompt_precmd() {
    vcs_info
}
add-zsh-hook precmd prompt_precmd

# Must run vcs_info when changing directories.
prompt_chpwd() {
    FORCE_RUN_VCS_INFO=1
}
add-zsh-hook chpwd prompt_chpwd

#RPROMPT='${vcs_info_msg_0_}'
setopt TRANSIENT_RPROMPT # Or not. your call.
vcs
