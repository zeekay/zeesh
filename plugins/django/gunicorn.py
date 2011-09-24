#import multiprocessing
#workers = multiprocessing.cpu_count() * 2 + 1

bind = "127.0.0.1:8000"
workers = 4
#worker_class = 'meinheld'
timeout = 500
pidfile ="/tmp/gunicorn.pid"
#logfile ="/tmp/gunicorn.log"
