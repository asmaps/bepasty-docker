#!/bin/bash
if [ ! -e /srv/bepasty/bepasty/bepasty.conf ]; then
    echo "Copying default bepasty.conf..."
    cp /opt/bepasty.conf /srv/bepasty/bepasty.conf
fi

exec gunicorn bepasty.wsgi -k gevent --log-level=info --name bepasty --bind=0.0.0.0:5000 --workers=4
