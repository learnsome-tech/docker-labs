#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
docker build -q -t m04l01-taskapi:1.0.0 .
docker tag m04l01-taskapi:1.0.0 m04l01-taskapi:1.0
docker tag m04l01-taskapi:1.0.0 m04l01-taskapi:1
docker image ls m04l01-taskapi
docker image inspect -f '{{json .RepoTags}}' m04l01-taskapi:1
docker tag alpine:3.22 m04l01-base:stable
docker run --rm m04l01-base:stable cat /etc/alpine-release
docker tag alpine:3.20 m04l01-base:stable
docker run --rm m04l01-base:stable cat /etc/alpine-release
docker rmi m04l01-base:stable
