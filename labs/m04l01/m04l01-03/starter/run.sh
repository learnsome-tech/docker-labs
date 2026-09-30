#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker tag alpine:3.22 m04l01-base:stable
docker run --rm m04l01-base:stable cat /etc/alpine-release
docker tag alpine:3.20 m04l01-base:stable
docker run --rm m04l01-base:stable cat /etc/alpine-release
docker rmi m04l01-base:stable
