#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker run --name exit-demo alpine:3.20 false; echo code:0$?
#   code:7
docker inspect exit-demo --format '{{.State.ExitCode}}'
#   7 exited
docker rm exit-demo
#   exit-demo
