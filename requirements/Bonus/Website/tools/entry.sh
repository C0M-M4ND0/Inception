#!/bin/sh
if [ ! -d "/var/www/html/website" ]; then
mkdir -p /var/www/html/website

cp /tmp/website /var/www/html/website
chmod -R 777 /var/www/html/website
fi
#to keep container runing
php -S 0.0.0.0:9999