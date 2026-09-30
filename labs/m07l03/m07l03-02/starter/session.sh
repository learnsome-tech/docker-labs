#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker build -q -t m07l03-api:1.0.0 . >/dev/null
base="docker run --rm m07l03-api:1.0.0"
$base id
#   uid=10001(app) gid=10001(app) groups=10001(app)
$base touch /home/app/x && echo writable
#   writable
$base grep -E 'CapBnd|NoNewPrivs|Seccomp:' /proc/1/status
#   CapBnd:	00000000a80425fb
#   NoNewPrivs:	0
#   Seccomp:	2
$base cat /sys/fs/cgroup/memory.max /sys/fs/cgroup/pids.max
#   max
#   max
docker inspect -f '{{.Config.StopSignal}}' m07l03-api:1.0.0
#   SIGTERM
