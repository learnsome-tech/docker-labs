#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
sh run-locked.sh; sleep 2
curl -sd '{"title":"locked"}' localhost:18505/tasks; echo
docker exec m05l05-api touch /app/x
docker exec m05l05-api grep CapBnd /proc/1/status
docker exec m05l05-api grep NoNewPrivs /proc/1/status
docker exec m05l05-api cat /sys/fs/cgroup/pids.max
docker stats --no-stream --format '{{.MemUsage}}' m05l05-api
docker rm -f m05l05-api && docker volume rm m05l05-data
