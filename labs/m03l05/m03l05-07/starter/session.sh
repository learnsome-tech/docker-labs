#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker run -d --name m03l05-bare alpine:3.20 sleep 300
#   12210d8e5285f0b21ae7f9e610087ab4e33f639b6c0771406bab51810198f223
docker run -d --init --name m03l05-init alpine:3.20 sleep 300
#   ecb99ae9e7464aa250e901addad720de6e4a183a0df0ea0e3690c6c4e6377be0
docker stop -t 3 m03l05-bare m03l05-init
#   m03l05-bare
#   m03l05-init
docker wait m03l05-bare m03l05-init
#   137
#   143
docker run --rm --init alpine:3.20 ps -o pid,comm
#   PID   COMMAND
#       1 docker-init
#   ...
docker rm m03l05-bare m03l05-init
#   m03l05-bare
#   m03l05-init
