#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker run --rm hello-world
#   Hello from Docker!
#   This message shows that your installation appears to be working correctly.
#   ...
#    1. The Docker client contacted the Docker daemon.
#    2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
#   ...
docker run --rm alpine:3.20 uname -m
#   aarch64
