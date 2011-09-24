### remote_mvim zeesh! plugin

##desc
# make sure to change settings in prefs file before usage
# ~/.zsh/plugins/remote_mvim/prefs
# local: <host of this machine>
# remote: <host of remote which will open file>
# cmd: <full path to remote's copy of mvim>
##csed

fpath=( ~/.zsh/plugins/remote_mvim/func $fpath )
autoload -U ~/.zsh/plugins/remote_mvim/func/*(:t)

alias mvim='zeesh_remote_mvim'
