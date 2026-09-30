#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker compose --progress quiet up -d --wait
docker compose ps --format '{{.Service}} {{.Status}}'
api="docker compose exec api"
$api id
$api touch /home/app/x
$api touch /tmp/x /data/x && echo writable
$api grep -E 'CapBnd|NoNewPrivs|Seccomp:' /proc/1/status
$api cat /sys/fs/cgroup/memory.max /sys/fs/cgroup/pids.max
curl -s localhost:18703/health; echo
