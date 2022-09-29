FROM debian:buster

RUN apt update && apt install mariadb-server -y

ADD tool/entry.sh /tmp/entry.sh
ADD tool/mariadb.sql /tmp/mariadb.sql
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod +x /tmp/entry.sh
RUN /tmp/entry.sh

ENTRYPOINT ["mysqld"]