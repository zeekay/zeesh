### uwsgi / zeesh! plugin

##desc
# wrapper for uwsgi to make restarting a bit easier
##csed

fpath=( ~/.zsh/plugins/uwsgi/func $fpath )
autoload -U ~/.zsh/plugins/uwsgi/func/*(:t)

## aliases
alias uwsgi=zeesh_uwsgi
