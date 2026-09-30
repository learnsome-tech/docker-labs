#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker image ls --tree alpine:3.22
#   IMAGE                   ID             DISK USAGE   CONTENT SIZE   EXTRA
#   alpine:3.22             14358309a308       13.4MB         4.21MB
#   ├─ linux/amd64          7c8cb692ae09           0B             0B
#   ├─ linux/arm/v6         b0abf1688d96           0B             0B
#   ├─ linux/arm/v7         cb5e421f9eab           0B             0B
#   ├─ linux/arm64/v8       2c9d26f410d0       13.3MB         4.12MB
#   ...
D=$(docker inspect -f '{{index .RepoDigests 0}}' alpine:3.22)
echo $D
#   alpine@sha256:14358309a308569c32bdc37e2e0e9694be33a9d99e68afb0f5ff33cc1f695dce
docker run --rm $D cat /etc/alpine-release
#   3.22.5
docker run --rm alpine:3.20@${D#*@} cat /etc/alpine-release
#   3.22.5
