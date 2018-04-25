FROM ubuntu:xenial

RUN apt-get update

RUN apt-get install -y \
	nginx \
	openssl \
	supervisor

# Generate our self-signed certificate
RUN mkdir -p /ssl
WORKDIR /ssl
RUN openssl req -subj '/CN=localhost' -x509 -newkey rsa:4096 -nodes -keyout key.pem -out cert.pem -days 365

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY proxy /etc/nginx/sites-enabled/default

WORKDIR /

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
