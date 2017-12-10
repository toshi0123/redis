FROM alpine:edge

RUN apk upgrade --no-cache && \
    apk add --no-cache redis \
    mkdir /data && \
    chown redis:redis /data

VOLUME /data

WORKDIR /data

ENTRYPOINT ["redis-server"]

EXPOSE 6379
