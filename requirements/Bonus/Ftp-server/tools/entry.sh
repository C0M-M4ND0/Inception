#!/bin/sh

if [ ! -d "/var/www/html" ]; then
    mkdir -p /var/www/html
fi

#add user for ftp 
adduser $FTP_USR --disabled-password
echo "$FTP_USR:$FTP_PSW" | /usr/sbin/chpasswd &> /dev/null
chown -R $FTP_USR:$FTP_USR /var/www/html
echo $FTP_USR | tee -a /etc/vsftpd.userlist &> /dev/null


echo -e "\e[32mFTP started now on port 21\e[0m"
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
