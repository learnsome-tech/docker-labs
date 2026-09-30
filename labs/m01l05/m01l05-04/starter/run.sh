#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker run --rm hello-world
docker run --rm alpine:3.20 uname -m
