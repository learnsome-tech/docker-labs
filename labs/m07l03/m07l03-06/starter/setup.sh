#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
docker build -q -t m07l03-api:1.0.0 . >/dev/null
base="docker run --rm m07l03-api:1.0.0"
$base id
$base touch /home/app/x && echo writable
$base grep -E 'CapBnd|NoNewPrivs|Seccomp:' /proc/1/status
$base cat /sys/fs/cgroup/memory.max /sys/fs/cgroup/pids.max
docker inspect -f '{{.Config.StopSignal}}' m07l03-api:1.0.0
docker compose --progress quiet up -d --wait
docker compose ps --format '{{.Service}} {{.Status}}'
api="docker compose exec api"
$api id
$api touch /home/app/x
$api touch /tmp/x /data/x && echo writable
$api grep -E 'CapBnd|NoNewPrivs|Seccomp:' /proc/1/status
$api cat /sys/fs/cgroup/memory.max /sys/fs/cgroup/pids.max
curl -s localhost:18703/health; echo
