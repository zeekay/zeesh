# linux specific conf

setopt extended_glob
export LS_COLORS='di=1;34:ln=35:so=32:pi=33;40:ex=31:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'

alias ls='ls --color=always -AF'

# no core dumps
ulimit -S -c 0 > /dev/null 2>&1


function ps(){
    if [ $1 ]; then
        /bin/ps $@
    else
        /bin/ps ux
    fi
}
