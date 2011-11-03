# cygwin zshfu plugin
fpath=( ~/.zsh/plugins/cygwin/func $fpath )
autoload -U  ~/.zsh/plugins/cygwin/func/*(:t)

export LS_COLORS='di=34:ln=35:so=32:pi=33;40:ex=31:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
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

