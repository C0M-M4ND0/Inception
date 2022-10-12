FROM debian:buster

ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_DATABASE

RUN apt update && apt install mariadb-server -y 
ADD tools/script.sh /tmp/script.sh
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod +x /tmp/script.sh
RUN /tmp/script.sh

ENTRYPOINT ["mysqld"]
