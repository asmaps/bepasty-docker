FROM ubuntu:14.04
MAINTAINER Arne Schauf

RUN apt-get update && apt-get upgrade -y && apt-get install -y python-pip python-dev
RUN pip install bepasty uwsgi

VOLUME /srv/bepasty
ENV BEPASTY_CONFIG /srv/bepasty/bepasty.conf
ENV PYTHONUNBUFFERED 0
EXPOSE 5000

WORKDIR /opt

ADD start.sh /opt/start.sh
ADD bepasty.conf /opt/bepasty.conf
ADD wsgi.py /opt/wsgi.py
RUN chmod 550 /opt/start.sh

CMD ["./start.sh"]
