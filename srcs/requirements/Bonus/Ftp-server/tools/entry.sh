#!/bin/sh

if [ ! -d "/var/www/html" ]; then
    mkdir -p /var/www/html
fi

#add user for ftp 
adduser $FTP_USR --disabled-password  > /dev/null 2>&1
echo "$FTP_USR:$FTP_PSW" | /usr/sbin/chpasswd > /dev/null 2>&1
chown -R $FTP_USR:$FTP_USR /var/www/html  > /dev/null 2>&1
echo $FTP_USR > /etc/vsftpd.userlist


echo -e "\e[32mFTP sis Running now ... \e[0m"
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
