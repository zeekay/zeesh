# linux specific conf
setopt extended_glob

alias ls='/bin/ls --color=always -AF'

# no core dumps
ulimit -S -c 0 > /dev/null 2>&1
