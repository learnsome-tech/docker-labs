#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker volume ls --filter name=m05l01
#   DRIVER    VOLUME NAME
#   local     m05l01-data
docker volume inspect -f '{{.Mountpoint}}' m05l01-data
#   /var/lib/docker/volumes/m05l01-data/_data
docker create --name m05l01-hold -v m05l01-data:/v alpine:3.20
#   a5e388b96ff8fe4f2be472c6c08b76a2e8dc090bf0e67c2d434efc1bf72c7da8
docker ps -a --filter volume=m05l01-data --format '{{.Names}}'
#   m05l01-hold
docker volume rm m05l01-data 2>&1 | cut -d'[' -f1
#   Error response from daemon: remove m05l01-data: volume is in use - 
docker rm m05l01-hold
#   m05l01-hold
docker volume rm m05l01-data
#   m05l01-data
