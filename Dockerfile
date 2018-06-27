FROM nginx

# TODO: Clean up apt-get config
RUN apt-get update \
	&& apt-get install openssl

# Generate our self-signed certificate
RUN mkdir -p /ssl
WORKDIR /ssl
RUN openssl req -subj '/CN=localhost' -x509 -newkey rsa:4096 -nodes -keyout key.pem -out cert.pem -days 365

COPY virtual-site.template /etc/nginx/conf.d/virtual-site.template

CMD ["/bin/bash", "-c", "envsubst < /etc/nginx/conf.d/virtual-site.template > /etc/nginx/conf.d/default.conf && exec nginx -g 'daemon off;'"]
