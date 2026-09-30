#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker build -q -t taskapi:m05l04 . >/dev/null
img=taskapi:m05l04
docker run -d --name m05l04-api -p 18504:8000 $img
#   b61f210941e8e0444e58e7243d248fe2a7b91b647e5d9e9ce0ad7bb05613b4c7
docker port m05l04-api
#   8000/tcp -> 0.0.0.0:18504
#   8000/tcp -> [::]:18504
sleep 1; curl -s localhost:18504/health; echo
#   {"status": "ok", "version": "1.0.0"}
docker rm -f m05l04-api
#   m05l04-api
docker run -d --name m05l04-api -p 127.0.0.1:18504:8000 $img
#   71005bac4fd06a6ace366592cdfd32a9a9b7303a9f23a8696c7ad0734ac14dac
docker port m05l04-api
#   8000/tcp -> 127.0.0.1:18504
docker rm -f m05l04-api
#   m05l04-api
