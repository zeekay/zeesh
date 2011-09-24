# cygwin zshfu plugin
fpath=( ~/.zsh/plugins/cygwin/func $fpath )
autoload -U  ~/.zsh/plugins/cygwin/func/*(:t)

# cygwin specific conf
export USING_CYGWIN=1
export EDITOR=/usr/bin/nano
export SHELL='/bin/zsh'
alias ls='ls -AF --color=auto'
alias find='/bin/find'
alias ex='explorer'
alias foo=foobar
alias fb=foobar
alias kill='/bin/kill -f'
alias ps='ps -W -a -f'
alias pk='zeesh_cyg_pkill'
alias uptime='zeesh_cyg_uptime'

# no core dumps
ulimit -S -c 0 > /dev/null 2>&1

