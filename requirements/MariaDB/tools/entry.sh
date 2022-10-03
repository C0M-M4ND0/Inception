#!/bin/bash

if [ ! -f "/tmp/mariadb.sql" ] ;then
touch /tmp/mariadb.sql
echo "create database if not exists ${MYSQL_DATABASE};" > /tmp/mariadb.sql
echo "grant all privileges on ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' identified by '${MYSQL_PASSWORD}';" >> /tmp/mariadb.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" >> /tmp/mariadb.sql
echo "flush privileges;" >> /tmp/mariadb.sql
fi

mysql_install_db
service mysql start
mysql -u root  < /tmp/mariadb.sql