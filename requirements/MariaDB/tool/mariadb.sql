create database if not exists wordpress;
grant all privileges on wordpress.* TO 'test'@'%' identified by 'password';
ALTER USER 'root'@'localhost' IDENTIFIED BY 'password';
flush privileges;


