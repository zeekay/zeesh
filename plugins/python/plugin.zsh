# python zshfu plugin
fpath=( ~/.zsh/plugins/python/func $fpath )
autoload -U ~/.zsh/plugins/python/func/*(:t)

# python
alias py=python
alias ipy=ipython
alias pyinstall='python setup.py install'
alias pystrap=zeesh_python_bootstrap
alias cds=zeesh_python_cd_site_packages
alias pipr='pip install -r requirements.txt'

# Start a local SMTP server and dump emails sent to it to the console
alias smtpconsole='python -m smtpd -n -c DebuggingServer localhost:1025'

# Serve the current folder on port 80
alias serve_this='python -m SimpleHTTPServer'

# pretty JSON
function pjson() {
    python -mjson.tool
}
function ipy_pdb() {
    ipython -pdb -c "%run $1"
}
compctl -K zeesh_python_ls_site_packages zeesh_python_cd_site_packages

export PYTHONSTARTUP=~/.pythonrc

pye(){ echo 'exec compile(''"'$@[1,-1]'"'', "<cmdline>", "single")' | python - }
alias pye='noglob pye'

#zstyle -e :urlglobber url-other-schema \
#'[[ $words[1] == scp ]] && reply=("*") || reply=(http https ftp)'

noipy(){
    export NOIPYTHON=1
    python
    unset NOIPYTHON
}
py-upgrade(){
    pip freeze --local | cut -d = -f 1 | xargs echo pip install -U
}
