#!/bin/ash

if [ ! -f "/usr/local/bin/wp" ]; then
{
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &> /dev/null
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
}
fi

if [ ! -d "/var/www/html/" ]; then
    mkdir -m 777 -p /var/www/html
fi

if ! wp core is-installed --allow-root --path=/var/www/html &> /dev/null; then
    wp core download --allow-root --path=/var/www/html &> /dev/null
fi

cp /tmp/wp-config.php /var/www/html/
cp /tmp/www.conf /etc/php7/php-fpm.d/www.conf

wp core install --allow-root --path=/var/www/html --url=$URL --title=$TITLE \
    --admin_user=$ADMIN_USER --admin_password=$WORDPRESS_DB_PASSWORD\
    --admin_email=$ADMIN_EMAIL &> /dev/null
if ! wp user list --allow-root --path=/var/www/html | grep $WORDPRESS_DB_USER &> /dev/null; then
wp user create --allow-root --path=/var/www/html $WORDPRESS_DB_USER $USER_EMAIL --user_pass=$WORDPRESS_DB_PASSWORD --role=author
else
    echo -e "\e[32mUser already exist\e[0m"
fi

echo -e "\e[32mWordpress is Running now on port 9000\e[0m"
/usr/sbin/php-fpm7 -F -R