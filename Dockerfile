FROM alpine:edge

RUN apk upgrade --no-cache && \
    apk add --no-cache redis su-exec

VOLUME /data

WORKDIR /data

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 6379

CMD ["redis-server"]
