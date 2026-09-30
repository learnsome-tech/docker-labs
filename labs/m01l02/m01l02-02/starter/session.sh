#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker run --rm alpine:3.20 ls /proc/self/ns
#   cgroup
#   ipc
#   mnt
#   net
#   pid
#   pid_for_children
#   time
#   time_for_children
#   user
#   uts
docker run --rm alpine:3.20 readlink /proc/self/ns/pid
#   pid:[4026533279]
