FROM alpine:3.13

RUN apk update && apk add --no-cache vsftpd

COPY ./conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

ENTRYPOINT [ "tail","-f", "/dev/null" ]