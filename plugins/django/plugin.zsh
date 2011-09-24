# django zshfu plugin
fpath=( ~/.zsh/plugins/django/func $fpath )
autoload -U  ~/.zsh/plugins/django/func/*(:t)

alias manage='./manage.py'
alias dj='./manage.py'
alias rs='./manage.py runserver'
alias djproj=_django_startproj
alias djapp='./manage.py startapp'
alias djsync'./manage.py syncdb'
alias djshell='./manage.py shell'
alias djload='./manage.py loaddata fixtures/*'

export _GUNICORN_PID=/tmp/gunicorn.pid

# run gunicorn
gs(){
    python manage.py run_gunicorn -c gunicorn.conf.py
}
# kill gunircorn
gsk() {
    if [ -f "$_GUNICORN_PID" ]; then 
        kill $(cat $_GUNICORN_PID)
        rm $_GUNICORN_PID
    fi
}
# reload gunicorn
gsr() {
    if [ -f "$_GUNICORN_PID" ]; then 
        kill -HUP $(cat $_GUNICORN_PID)
    fi
}
