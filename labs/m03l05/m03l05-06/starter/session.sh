#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker run -d --name m03l05-exec m03l05-api
#   e342da99f66a5989cb230274605d929c3ccce0ad9a67b51c7a45f95873925647
w='python app.py; echo stopped'
docker run -d --name m03l05-wrap m03l05-api sh -c "$w"
#   aaba43f79aaa49bc6d6c1b38d76a81a2fb3f4519f76c47a61b9bcd93170e4b8f
sleep 1; docker exec m03l05-wrap ps -o pid,args
#   PID   COMMAND
#       1 sh -c python app.py; echo stopped
#   ...
docker stop -t 3 m03l05-exec m03l05-wrap
#   m03l05-exec
#   m03l05-wrap
docker wait m03l05-exec m03l05-wrap
#   0
#   137
docker logs m03l05-exec
#   listening on port 8000
#   shutting down
docker logs m03l05-wrap
#   listening on port 8000
docker rm m03l05-exec m03l05-wrap
#   m03l05-exec
#   m03l05-wrap
