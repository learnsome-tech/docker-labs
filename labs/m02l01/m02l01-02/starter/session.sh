#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker pull alpine:3.20
#   3.20: Pulling from library/alpine
#   ...
#   Status: Downloaded newer image for alpine:3.20
#   docker.io/library/alpine:3.20
docker image ls alpine:3.20
#   REPOSITORY   TAG    IMAGE ID    CREATED    SIZE
#   alpine       3.20   ...         ...        ...
