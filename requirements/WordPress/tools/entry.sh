#!/bin/ash

if [ ! -f "/usr/local/bin/wp" ]; then
{
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > /dev/null 2>&1
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
}
fi

if [ ! -d "/var/www/html/" ]; then
    mkdir -m 777 -p /var/www/html
fi

wp core download --allow-root --path=/var/www/html > /dev/null 2>&1

cp /tmp/wp-config.php /var/www/html/
cp /tmp/www.conf /etc/php7/php-fpm.d/www.conf

wp core install --allow-root --path=/var/www/html --url=$URL --title=$TITLE \
    --admin_user=$ADMIN_USER --admin_password=$WORDPRESS_DB_PASSWORD\
    --admin_email=$ADMIN_EMAIL > /dev/null 2>&1
if ! wp user list --allow-root --path=/var/www/html/ | grep $WORDPRESS_DB_USER > /dev/null 2>&1; then
wp user create --allow-root --path=/var/www/html $WORDPRESS_DB_USER $USER_EMAIL --user_pass=$WORDPRESS_DB_PASSWORD --role=author > /dev/null 2>&1
else
    echo -e "\e[32mUser already exist\e[0m"
fi
#install redis cache for WordPress
wp plugin install redis-cache --activate --allow-root --path=/var/www/html > /dev/null 2>&1
wp plugin update --all --allow-root --path=/var/www/html > /dev/null 2>&1
wp redis enable --allow-root --path=/var/www/html > /dev/null 2>&1

echo -e "\e[32mWordpress is Running now on port 9000\e[0m"
/usr/sbin/php-fpm7 -F -R