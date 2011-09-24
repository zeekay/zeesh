# virtualenv zshfu plugin
fpath=( ~/.zsh/plugins/virtualenv/func $fpath )
autoload -U ~/.zsh/plugins/virtualenv/func/*(:t)

compctl -K zeesh_ve_list zeesh_ve_activate

# aliases
alias act=zeesh_ve_activate
alias dact=zeesh_ve_deactivate
alias cdv=zeesh_ve_cd_proj_dir
alias newenv=zeesh_ve_newenv

# virtualenv config
export VIRTUALENV_USE_DISTRIBUTE
export VIRTUALENVS_DIR=~/ve
