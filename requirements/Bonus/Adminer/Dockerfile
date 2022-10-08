FROM alpine:3.13

RUN apk update && apk add wget php php-mysqli

ADD ./tools/entry.sh /tmp/entry.sh
RUN chmod +x /tmp/entry.sh

ENTRYPOINT [ "/tmp/entry.sh" ]