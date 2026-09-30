#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker inspect -f '{{.Config.ExposedPorts}}' taskapi:m05l04
#   map[8000/tcp:{}]
docker run -d --name m05l04-auto -P taskapi:m05l04
#   8ccc2836909a4a2b0f97c113426e2b6579fb3cf6aac2b28a9ee7260b378f6bcd
hp=$(docker port m05l04-auto 8000/tcp | sed -n 1p)
sleep 1; curl -s $hp/health; echo
#   {"status": "ok", "version": "1.0.0"}
docker rm -f m05l04-auto
#   m05l04-auto
