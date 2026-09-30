#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
cat base/Dockerfile
docker build -q -t m04l04-base:old base
docker run --rm m04l04-base:old
docker build -q -t m04l04-base:new --build-arg TAG=3.22 base
docker run --rm m04l04-base:new
docker rmi m04l04-base:old m04l04-base:new m04l04-taskapi:1
