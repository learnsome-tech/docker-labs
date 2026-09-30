#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

opts="-m 64m --health-interval 1s --health-retries 2"
docker run -d --name m07l01-sick -e PORT=9000 $opts m07l01-api
#   afe10bc78d2cec07f8ea165089419017833706ae6ade4f980670ce68d16c933f
sleep 4
docker ps -f name=m07l01-sick --format '{{.Status}}'
#   Up 4 seconds (unhealthy)
f='{{(index .State.Health.Log 0).Output}}'
docker inspect -f "$f" m07l01-sick
#   wget: can't connect to remote host (127.0.0.1): Connection refused
docker logs m07l01-sick
#   listening on port 9000
docker stats --no-stream --format '{{.MemUsage}}' m07l01-sick
#   13.11MiB / 64MiB
docker rm -f m07l01-sick
#   m07l01-sick
