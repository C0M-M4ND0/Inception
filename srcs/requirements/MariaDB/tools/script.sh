#!/bin/bash
cat << EOF > file
create database if not exists $MYSQL_DATABASE;
grant all privileges on $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' identified by '$MYSQL_PASSWORD';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
flush privileges;
EOF

mysql_install_db --basedir=/usr  --datadir=/var/lib/mysql > /dev/null
service mysql start
mysql -u root  < file
rm -rf file