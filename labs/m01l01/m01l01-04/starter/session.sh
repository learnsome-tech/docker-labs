#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker run --rm alpine:3.20 uname -o
#   Linux
docker run --rm alpine:3.20 grep ^NAME= /etc/os-release
#   NAME="Alpine Linux"
docker run --rm debian:13 grep ^NAME= /etc/os-release
#   NAME="Debian GNU/Linux"
