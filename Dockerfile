FROM ubuntu:14.04
MAINTAINER Arne Schauf

RUN apt-get update && apt-get upgrade -y && apt-get install -y python-pip python-dev
RUN pip install bepasty gunicorn gevent

VOLUME /srv/bepasty
ENV BEPASTY_CONFIG /srv/bepasty/bepasty.conf
EXPOSE 5000

ADD start.sh /opt/start.sh
ADD bepasty.conf /opt/bepasty.conf
RUN chmod 550 /opt/start.sh

CMD ["/opt/start.sh"]
