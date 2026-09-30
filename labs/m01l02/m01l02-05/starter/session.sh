#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

cg=/sys/fs/cgroup
docker run --rm alpine:3.20 cat $cg/memory.max
#   max
docker run --rm -m 64m alpine:3.20 cat $cg/memory.max
#   67108864
docker run --rm --cpus=0.5 alpine:3.20 cat $cg/cpu.max
#   50000 100000
docker run --rm --pids-limit=20 alpine:3.20 cat $cg/pids.max
#   20
