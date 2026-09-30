#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker exec command-demo ps
#   PID   COMMAND
#       1 sh
#      10 sleep
docker exec command-demo true
#   ready
docker top command-demo
#   UID   PID   PPID   C   STIME   TTY   TIME   CMD
#   ...
