#!/bin/ash

if [ ! -f "/usr/local/bin/wp" ]; then
{
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
}
fi

if [ ! -f "/var/www/html/wp-config.php" ]; then
{
    mkdir -m 777 -p /var/www/html
    wp core download --allow-root --path=/var/www/html
    mv /tmp/wp-config.php /var/www/html/
    mv /tmp/www.conf /etc/php7/php-fpm.d/www.conf
}
fi
echo -e "\e[32mWordpress is Running now on port 9000\e[0m"
/usr/sbin/php-fpm7 -F -R