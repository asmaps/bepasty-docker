FROM ubuntu:14.04
MAINTAINER Arne Schauf

RUN apt-get update && apt-get upgrade -y && apt-get install -y python3-pip
RUN pip3 install bepasty gunicorn gevent

VOLUME /srv/bepasty
EXPOSE 5000

ENTRYPOINT gunicorn bepasty.wsgi
CMD ["--log-level=info", "--name bepasty", "--bind=0.0.0.0:5000", "--workers=4"]
