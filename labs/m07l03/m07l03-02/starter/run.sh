#!/usr/bin/env bash
set -u
docker build -q -t m07l03-api:1.0.0 . >/dev/null
base="docker run --rm m07l03-api:1.0.0"
$base id
$base touch /home/app/x && echo writable
$base grep -E 'CapBnd|NoNewPrivs|Seccomp:' /proc/1/status
$base cat /sys/fs/cgroup/memory.max /sys/fs/cgroup/pids.max
docker inspect -f '{{.Config.StopSignal}}' m07l03-api:1.0.0
