FROM debian:buster

RUN apt-get update \
    && apt-get -y install curl
ADD tools/entry.sh /tmp/entry.sh

RUN chmod +x /tmp/entry.sh

ENTRYPOINT [ "/tmp/entry.sh" ]
