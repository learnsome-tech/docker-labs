#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

sh run-locked.sh; sleep 2
#   fc55a3b07b10616d97e94769cf348424ae99236737ac77319fb85a87164f103e
curl -sd '{"title":"locked"}' localhost:18505/tasks; echo
#   {"tasks": ["locked"]}
docker exec m05l05-api touch /app/x
#   touch: /app/x: Read-only file system
docker exec m05l05-api grep CapBnd /proc/1/status
#   CapBnd:	0000000000000000
docker exec m05l05-api grep NoNewPrivs /proc/1/status
#   NoNewPrivs:	1
docker exec m05l05-api cat /sys/fs/cgroup/pids.max
#   64
docker stats --no-stream --format '{{.MemUsage}}' m05l05-api
#   14.8MiB / 128MiB
docker rm -f m05l05-api && docker volume rm m05l05-data
#   m05l05-api
#   m05l05-data
