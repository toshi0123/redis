#!/bin/sh

chown -R redis .
exec su-exec redis redis-server \
  --bind `ip route | grep -v default | awk '/eth0/{print $1}'` \
  --dir ./ \
  --save 900 1 \
  --save 300 10 \
  --save 60 10000
