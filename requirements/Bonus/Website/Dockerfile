FROM alpine:3.13

RUN apk update && apk add php

ADD ./tools/website /tmp/website

ADD ./tools/entry.sh /tmp/entry.sh
RUN chmod +x /tmp/entry.sh

ENTRYPOINT [ "/tmp/entry.sh" ]