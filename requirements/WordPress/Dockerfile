FROM alpine:3.13

RUN apk update && apk add php-fpm wget

RUN wget http://wordpress.org/latest.tar.gz -P /var/www/html

RUN tar -xzvf /var/www/html/latest.tar.gz

RUN rm /var/www/html/latest.tar.gz

