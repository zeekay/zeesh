### ipython / zeesh! plugin

##desc
# wrapper for ipython
##csed

# fpath=( ~/.zsh/plugins/ipython/func $fpath )
# autoload -U ~/.zsh/plugins/ipython/func/*(:t)
export _kernel_home=~/.ipython/profile_default/security

ipython-kernel-launch(){
    ipython kernel &!
    local pid=$!
    echo "--existing kernel-$pid.json" | pbcopy
}

ipython-kernel-list(){
    for f in `ls $_kernel_home`; do
        echo `basename $f` | sed 's/\(kernel-[0-9]*\).*/\1/'
    done
}

_ipython-kill-pid(){
    kill `echo $1 | sed 's/kernel-\([0-9]*\).*/\1/'`
    rm $_kernel_home/$1.json
    echo "killed $1"
}

ipython-kill(){
    if [ $1 ]; then
        if [[ $1 == "all" ]]; then
            for kernel in `ipython-kernel-list`; do
                _ipython-kill-pid $kernel
            done
        else
            for kernel in `ipython-kernel-list | /usr/bin/grep $1`; do
                _ipython-kill-pid $kernel
            done
        fi
    fi
}

ipython-kernel(){
    if [ $1 ]; then
        case $1 in
            kill)
                if [ $2 ]; then
                    ipython-kill $2
                else
                    echo "Specify a kernel to kill"
                fi
            ;;
            launch)
                ipython-kernel-launch
            ;;
            list|*)
                ipython-kernel-list
            ;;
        esac
    else
        ipython-kernel-list
    fi
}
