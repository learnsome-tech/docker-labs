#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker tag alpine:3.22 m04l01-base:stable
docker run --rm m04l01-base:stable cat /etc/alpine-release
#   3.22.5
docker tag alpine:3.20 m04l01-base:stable
docker run --rm m04l01-base:stable cat /etc/alpine-release
#   3.20.10
docker rmi m04l01-base:stable
#   Untagged: m04l01-base:stable
