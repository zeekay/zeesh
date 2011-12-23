### django / zeesh! plugin
fpath=( ~/.zsh/plugins/django/func $fpath )
autoload -U  ~/.zsh/plugins/django/func/*(:t)

## exports
export _GUNICORN_PID=/tmp/gunicorn.pid

## aliases
alias manage='./manage.py'
alias dj='./manage.py'
alias rs='./manage.py runserver'
alias djproj=django-startproj
alias djapp='./manage.py startapp'
alias djsync'./manage.py syncdb'
alias djshell='./manage.py shell'
alias djload='./manage.py loaddata fixtures/*'

## functions
gs() {
    python manage.py run_gunicorn -c gunicorn.conf.py
}

gsk() {
    if [ -f "$_GUNICORN_PID" ]; then
        kill $(cat $_GUNICORN_PID)
        rm $_GUNICORN_PID
    fi
}

gsr() {
    if [ -f "$_GUNICORN_PID" ]; then
        kill -HUP $(cat $_GUNICORN_PID)
    fi
}
