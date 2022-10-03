FROM debian:buster
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_DATABASE

RUN apt update && apt install mariadb-server -y

ADD tools/entry.sh /tmp/entry.sh
# ADD tools/mariadb.sql /tmp/mariadb.sql
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod +x /tmp/entry.sh
RUN /tmp/entry.sh

ENTRYPOINT ["mysqld"]
