#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
pol="--restart on-failure:3"
docker run -d --name m07l01-loop $pol -e PORT=x m07l01-api
sleep 5
docker inspect -f '{{.RestartCount}}' m07l01-loop
docker logs m07l01-loop 2>&1 | grep -c Traceback
e='--format={{.Action}} {{.Actor.Attributes.exitCode}}'
w="--since 20s --until 0s"
docker events $w -f container=m07l01-loop "$e"
docker rm m07l01-loop
