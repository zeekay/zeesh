### python / zeesh! plugin

fpath=( ~/.zsh/plugins/python/func $fpath )
autoload -U ~/.zsh/plugins/python/func/*(:t)

compctl -K site-packages-ls site-packages-cd

## exports
export PYTHONSTARTUP=~/.pythonrc

## aliases
alias py=python
alias ipy=ipython
alias pyinstall='python setup.py install'
alias cds=site-packages-cd
alias pipi='pip install --use-mirrors'
alias pipu='pip install -U --use-mirrors'
alias pipr='pip install --use-mirrors -r requirements.txt'
alias smtpconsole='python -m smtpd -n -c DebuggingServer localhost:1025'
alias serve-this='python -m SimpleHTTPServer'
alias pye='noglob pye'

## functions
pjson() {
    python -mjson.tool
}

ipy-pdb() {
    ipython -pdb -c "%run $1"
}

noipy() {
    export NOIPYTHON=1
    python
    unset NOIPYTHON
}

py-upgrade() {
    pip freeze --local | cut -d = -f 1 | xargs echo pip install -U
}

pye(){ echo 'exec compile(''"'$@[1,-1]'"'', "<cmdline>", "single")' | python - }
