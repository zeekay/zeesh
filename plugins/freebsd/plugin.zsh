# freebsd zshfu plugin
export EDITOR=/usr/local/bin/nano
alias ls='ls -AGF'
compctl -K list_sysctls sysctl
compctl -c man
compctl -c info
compctl -c which
# no core dumps
limit core 0
