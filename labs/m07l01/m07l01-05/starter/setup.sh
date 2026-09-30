#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
docker build -q -t m07l01-api . >/dev/null
docker run --name m07l01-bad -e PORT=eighty m07l01-api
lim="-m 32m --memory-swap 32m"
docker run --name m07l01-oom $lim alpine:3.22 tail /dev/zero
f='{{.State.ExitCode}} {{.State.OOMKilled}}'
docker inspect -f "$f" m07l01-bad m07l01-oom
docker rm m07l01-bad m07l01-oom
docker run -d --name m07l01-api m07l01-api
docker run -d --name m07l01-idle alpine:3.22 sleep 300
docker run -d --init --name m07l01-init alpine:3.22 sleep 300
docker stop m07l01-api m07l01-init
docker stop -t 2 m07l01-idle
docker ps -a -f name=m07l01 --format '{{.Names}} {{.Status}}'
docker logs m07l01-api
docker rm m07l01-api m07l01-idle m07l01-init
pol="--restart on-failure:3"
docker run -d --name m07l01-loop $pol -e PORT=x m07l01-api
sleep 5
docker inspect -f '{{.RestartCount}}' m07l01-loop
docker logs m07l01-loop 2>&1 | grep -c Traceback
e='--format={{.Action}} {{.Actor.Attributes.exitCode}}'
w="--since 20s --until 0s"
docker events $w -f container=m07l01-loop "$e"
docker rm m07l01-loop
