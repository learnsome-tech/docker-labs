#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

HC='--health-cmd false --health-interval 1s'
docker run -d --name m06l02-sick $HC busybox:1.37 sleep 60
#   8bc9dbcc3ce2d38e30f4786070ea00ab08d2b1b80ff5fa2a840ece0c3af8d70b
sleep 5
docker ps -f name=m06l02-sick --format '{{.Status}}'
#   Up 5 seconds (unhealthy)
docker rm -f m06l02-sick
#   m06l02-sick
docker compose down -v
#    Container m06l02-stack-api-1 Stopping
#   ...
#    Network m06l02-stack_default Removed
docker image rm taskapi:m06l02
#   Untagged: taskapi:m06l02
#   Deleted: sha256:927be4b0991026b7c7df2668c3ab8e0c1ba6b38ac2e86af48f61845e4bcfe9ad
