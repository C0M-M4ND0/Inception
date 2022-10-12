#!/bin/sh
if [ ! -d "/var/www/html/website" ]; then
mkdir -p /var/www/html/website

cp -r /tmp/website /var/www/html
chmod -R 777 /var/www/html/website/
fi
#to keep container runing
echo -e "\e[32mWEBSITE is Running now ...\e[0m"
php -S 0.0.0.0:9999 > /dev/null 2>&1