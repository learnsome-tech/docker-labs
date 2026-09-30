#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker build -q -t taskapi:m05l03 . >/dev/null
docker run -d --name m05l03-api taskapi:m05l03
#   7d4da310d579b2dd95fbaed6894ddc856187487052c22fbc608a788bf9ef3abe
docker inspect -f '{{.HostConfig.NetworkMode}}' m05l03-api
#   bridge
docker run --rm alpine:3.20 ping -c1 -W1 m05l03-api
#   ping: bad address 'm05l03-api'
ip=$(docker exec m05l03-api hostname -i); echo $ip
#   172.17.0.2
docker run --rm alpine:3.20 wget -qO- $ip:8000/health; echo
#   {"status": "ok", "version": "1.0.0"}
