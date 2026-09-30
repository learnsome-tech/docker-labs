#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker run --rm alpine:3.20 ps -o comm
#   COMMAND
#   ps
docker run --rm --pid=host alpine:3.20 ps -o comm|sed -n 2,4p
#   initd
#   kthreadd
#   pool_workqueue_
docker run --rm --uts=host alpine:3.20 hostname
#   docker-desktop
