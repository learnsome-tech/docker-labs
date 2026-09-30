#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker compose --progress quiet up -d --wait
docker compose ps --format '{{.Service}} {{.Status}}'
#   api Up 3 seconds (healthy)
#   db Up 9 seconds (healthy)
api="docker compose exec api"
$api id
#   uid=10001(app) gid=10001(app) groups=10001(app)
$api touch /home/app/x
#   touch: /home/app/x: Read-only file system
$api touch /tmp/x /data/x && echo writable
#   writable
$api grep -E 'CapBnd|NoNewPrivs|Seccomp:' /proc/1/status
#   CapBnd:	0000000000000000
#   NoNewPrivs:	1
#   Seccomp:	2
$api cat /sys/fs/cgroup/memory.max /sys/fs/cgroup/pids.max
#   134217728
#   64
curl -s localhost:18703/health; echo
#   {"status": "ok", "version": "1.0.0"}
