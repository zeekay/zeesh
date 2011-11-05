# freebsd zshfu plugin

export LSCOLORS=ExfxcxdxbxegedabagAcEx
alias ls='ls -AGF'
compctl -K list_sysctls sysctl
compctl -c man
compctl -c info
compctl -c which
# no core dumps
limit core 0

function ps(){
    if [ $1 ]; then
        /bin/ps $@
    else
        /bin/ps ux
    fi
}
