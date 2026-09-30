#!/usr/bin/env bash
set -u
docker build -q -t m04l01-taskapi:1.0.0 .
docker tag m04l01-taskapi:1.0.0 m04l01-taskapi:1.0
docker tag m04l01-taskapi:1.0.0 m04l01-taskapi:1
docker image ls m04l01-taskapi
docker image inspect -f '{{json .RepoTags}}' m04l01-taskapi:1
