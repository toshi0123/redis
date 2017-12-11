#!/bin/sh

chown -R redis .
exec su-exec redis "$@"
