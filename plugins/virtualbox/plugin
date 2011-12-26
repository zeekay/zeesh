### virtualbox / zeesh! plugin

# make sure to change settings in prefs file before usage
# ~/.zsh/plugins/virtualbox/prefs
# default: <virtual machine to apply commands to by default>
# vboxmanage: <location of VBoxManage, typically /usr/bin/VBoxManage or /c/cygdrive/c/Program\ Files/Oracle/VirtualBox/VBoxManage.exe>

fpath=( ~/.zsh/plugins/virtualbox/func ~/.zsh/plugins/virtualbox/comp $fpath )
autoload -U ~/.zsh/plugins/virtualbox/func/*(:t)
autoload -U ~/.zsh/plugins/virtualbox/comp/*(:t)

## aliases
alias vbox='vbox-manage'

## functions
vbox-create-rawdisk() {
    sudo VBoxManage internalcommands createrawvmdk -filename $1 -rawdisk $2
}
