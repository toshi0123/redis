FROM alpine:edge

RUN apk upgrade --no-cache && \
    apk add --no-cache redis su-exec && \
    mkdir /data && chown redis:redis /data

VOLUME /data

WORKDIR /data

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 6379

CMD ["redis-server","--bind 0.0.0.0"]
