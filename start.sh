#!/bin/bash
if [ ! -e /srv/bepasty/bepasty.conf ]; then
    echo "Copying default bepasty.conf..."
    cp /opt/bepasty.conf /srv/bepasty/bepasty.conf
fi

export PYTHONUNBUFFERED=0
mkdir -p /srv/bepasty/logs
mkdir -p /srv/bepasty/storage
exec uwsgi --http 0.0.0.0:5000 --wsgi-file wsgi.py --master --processes 4 --threads 2
# exec gunicorn bepasty.wsgi -k gevent --log-level=info --name bepasty --bind=0.0.0.0:5000 --workers=4
