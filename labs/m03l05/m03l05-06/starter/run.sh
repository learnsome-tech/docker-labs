#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker run -d --name m03l05-exec m03l05-api
w='python app.py; echo stopped'
docker run -d --name m03l05-wrap m03l05-api sh -c "$w"
sleep 1; docker exec m03l05-wrap ps -o pid,args
docker stop -t 3 m03l05-exec m03l05-wrap
docker wait m03l05-exec m03l05-wrap
docker logs m03l05-exec
docker logs m03l05-wrap
docker rm m03l05-exec m03l05-wrap
