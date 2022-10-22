FROM alpine:3.13

RUN apk update && apk add nginx openssl


# #SSL
RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey \
    rsa:2048 -keyout /etc/nginx/ssl/nginx-selfsigned.key \
    -out /etc/nginx/ssl/nginx-selfsigned.crt \
    -subj '/CN=oabdelha.42.fr'
    
RUN mkdir -p /run/nginx
ADD configuration/nginx.conf /etc/nginx/http.d/default.conf
RUN mkdir -p /var/www/html
# #start ngnix
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
