#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker run --rm alpine:3.20 uname -o
docker run --rm alpine:3.20 grep ^NAME= /etc/os-release
docker run --rm debian:13 grep ^NAME= /etc/os-release
