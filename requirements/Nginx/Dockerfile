FROM alpine:3
MAINTAINER C0MM4ND0

RUN apk update && apk add nginx && apk add openssl

#SSL
RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -newkey rsa:4096 -keyout \
    /etc/nginx/ssl/key.pem -out /etc/nginx/ssl/cert.pem \
    -sha256 -days 365 -nodes \
    -subj '/CN=localhost'

ADD configuration/nginx.conf /etc/nginx/conf.d/default.conf
RUN mkdir -p /var/www/html
ADD configuration/index.html /var/www/html/

#start ngnix
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]