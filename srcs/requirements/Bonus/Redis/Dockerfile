FROM alpine:3.13

RUN apk update && apk add --no-cache redis

COPY ./conf/redis.conf /etc/redis.conf

ENTRYPOINT [ "redis-server", "/etc/redis.conf" ]
