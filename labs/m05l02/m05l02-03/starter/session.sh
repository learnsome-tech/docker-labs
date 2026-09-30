#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker run --rm -v ./data:/data:ro alpine:3.20 touch /data/x
#   touch: /data/x: Read-only file system
docker run --rm -v ./typo:/n alpine:3.20 true && ls
#   Dockerfile
#   app.py
#   compose.yaml
#   data
#   typo
docker run --mount type=bind,src=/typo,dst=/n alpine:3.20
#   docker: Error response from daemon: invalid mount config for type "bind": bind source path does not exist: /typo
#   
#   Run 'docker run --help' for more information
rmdir typo
