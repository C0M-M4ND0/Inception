#!/bin/sh

if [ ! -d "/var/www/html/adminer" ]; then
mkdir -p /var/www/html/adminer
cd /var/www/html/adminer/
#install admine from their official website
wget -O index.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php > /dev/null 2>&1
#change the permission of the downloaded file
chmod -R 777 /var/www/html/adminer/
fi

#to keep container runing
echo -e "\e[32mADMINER is Running now ...\e[0m"
php -S 0.0.0.0:7777 > /dev/null 2>&1