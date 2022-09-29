#!/bin/bash

mysql_install_db
service mysql start
mysql -u root < /tmp/mariadb.sql