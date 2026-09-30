#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker stop lifecycle-demo
#   lifecycle-demo
docker ps -a --filter name=lifecycle-demo
#   lifecycle-demo Exited (0) ... ago
docker start -a lifecycle-demo
#   
