#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker run -d --name m03l05-bare alpine:3.20 sleep 300
docker run -d --init --name m03l05-init alpine:3.20 sleep 300
docker stop -t 3 m03l05-bare m03l05-init
docker wait m03l05-bare m03l05-init
docker run --rm --init alpine:3.20 ps -o pid,comm
docker rm m03l05-bare m03l05-init
