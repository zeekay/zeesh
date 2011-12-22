# virtualenv zshfu plugin
fpath=( ~/.zsh/plugins/virtualenv/func $fpath )
autoload -U ~/.zsh/plugins/virtualenv/func/*(:t)

compctl -K ve-list ve-activate

# aliases
alias act=ve-activate
alias dact=ve-deactivate
alias cdv=ve-cd
alias newenv='ve-newenv --system-site-packages --unzip-setuptools --distribute'

# virtualenv config
export VIRTUALENVS_DIR=~/ve
