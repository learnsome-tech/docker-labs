#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker logs taskapi-demo
#   ...
#   GET /health 200
docker stop taskapi-demo
#   taskapi-demo
docker ps -a --filter name=taskapi-demo
#   taskapi-demo Exited (0) ... ago
