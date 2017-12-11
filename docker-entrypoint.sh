#!/bin/sh

chown -R redis .
exec su-exec redis redis-server \
  --bind 0.0.0.0 \
  --dir ./ \
  --save 900 1 \
  --save 300 10 \
  --save 60 10000
