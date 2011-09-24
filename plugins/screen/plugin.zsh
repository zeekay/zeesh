fpath=( ~/.zsh/plugins/screen/func $fpath )
autoload -U  ~/.zsh/plugins/screen/func/*(:t)

alias screens='screen -ls'
alias wipe='screen -wipe'
alias clean=zeesh_screen_kill_detached
alias quit='zeesh_screen_kill_all'
