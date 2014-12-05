#!/usr/bin/env bash


# TODO route log output to file.
python manage.py collectstatic
python manage.py syncdb

python manage.py shell < run_alliance_corp_update.py

python manage.py celeryd &
python manage.py celerybeat &

#python manage.py runserver &
#gunicorn_django --workers=5 --bind 127.0.0.1:8000 &
/home/auth/infernal-auth/bin/gunicorn_django --workers=3 --bind 127.0.0.1:8000 &
