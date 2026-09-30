#!/bin/sh
# Back up or restore a named volume through a throwaway container.
# usage: sh vol.sh backup|restore volume-name
set -eu
mode=$1 vol=$2
mkdir -p backup
if [ "$mode" = backup ]; then
  docker run --rm -v "$vol":/data:ro -v "$PWD/backup":/backup alpine:3.20 \
    tar czvf "/backup/$vol.tar.gz" -C /data .
else
  docker run --rm -v "$vol":/data -v "$PWD/backup":/backup alpine:3.20 \
    tar xzf "/backup/$vol.tar.gz" -C /data
fi
