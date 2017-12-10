FROM alpine:edge

RUN apk upgrade --no-cache && \
    apk add --no-cache redis && \
    mkdir /data && \
    chown redis:redis /data && \
    sed -i -e '/^daemonize /s|yes|no|' -e '/^dir /s|^dir .*$|dir /data|g' -e '/^protected-mode /s/yes/no/g' /etc/redis.conf 

VOLUME /data

WORKDIR /data

ENTRYPOINT ["redis-server","/etc/redis.conf"]

EXPOSE 6379
