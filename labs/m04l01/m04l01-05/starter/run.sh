#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker image ls --tree alpine:3.22
D=$(docker inspect -f '{{index .RepoDigests 0}}' alpine:3.22)
echo $D
docker run --rm $D cat /etc/alpine-release
docker run --rm alpine:3.20@${D#*@} cat /etc/alpine-release
