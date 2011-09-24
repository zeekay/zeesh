# python zshfu plugin
fpath=( ~/.zsh/plugins/share/func $fpath )
autoload -U _scp_share

# share
alias share=_scp_share
