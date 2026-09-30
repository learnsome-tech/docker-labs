#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker run -d --name m03l04-web -p 18304:8000 m03l04-api
sleep 1; curl -s localhost:18304/health; echo
docker port m03l04-web
docker rm -f m03l04-web
