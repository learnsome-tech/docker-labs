#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
docker build -q -t taskapi:m05l04 . >/dev/null
img=taskapi:m05l04
docker run -d --name m05l04-api -p 18504:8000 $img
docker port m05l04-api
sleep 1; curl -s localhost:18504/health; echo
docker rm -f m05l04-api
docker run -d --name m05l04-api -p 127.0.0.1:18504:8000 $img
docker port m05l04-api
docker rm -f m05l04-api
