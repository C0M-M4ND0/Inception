FROM alpine:3

RUN apk update && apk add nginx openssl


# #SSL
RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey \
    rsa:2048 -keyout /etc/nginx/ssl/nginx-selfsigned.key \
    -out /etc/nginx/ssl/nginx-selfsigned.crt \
    -subj "/C=US/ST=Utah/L=Lehi/O=no, Inc./OU=IT/CN=localhost"

ADD configuration/nginx.conf /etc/nginx/http.d/default.conf
RUN mkdir -p /var/www/html
ADD configuration/index.html /var/www/html/
# #start ngnix
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
