FROM alpine:3.13

RUN apk update && apk add --no-cache vsftpd

COPY ./conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

ADD ./tools/entry.sh /tmp/entry.sh

RUN chmod +x /tmp/entry.sh
EXPOSE 21 20 10090-10100
ENTRYPOINT [ "/tmp/entry.sh" ]
