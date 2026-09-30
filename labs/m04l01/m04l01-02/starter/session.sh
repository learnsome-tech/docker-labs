#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker build -q -t m04l01-taskapi:1.0.0 .
#   sha256:8b3213dd88d2a5954a0daae2046ee88659d0fc0719f03867aea142612690947a
docker tag m04l01-taskapi:1.0.0 m04l01-taskapi:1.0
docker tag m04l01-taskapi:1.0.0 m04l01-taskapi:1
docker image ls m04l01-taskapi
#   IMAGE                  ID             DISK USAGE   CONTENT SIZE   EXTRA
#   m04l01-taskapi:1       8b3213dd88d2       87.8MB         21.4MB
#   m04l01-taskapi:1.0     8b3213dd88d2       87.8MB         21.4MB
#   m04l01-taskapi:1.0.0   8b3213dd88d2       87.8MB         21.4MB
docker image inspect -f '{{json .RepoTags}}' m04l01-taskapi:1
#   ["m04l01-taskapi:1","m04l01-taskapi:1.0","m04l01-taskapi:1.0.0"]
