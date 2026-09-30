#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

pol="--restart on-failure:3"
docker run -d --name m07l01-loop $pol -e PORT=x m07l01-api
#   b6d55c0b26d80f497639aeeff29e8abe82db36a8327fe2558cabd7fc91b11cc2
sleep 5
docker inspect -f '{{.RestartCount}}' m07l01-loop
#   3
docker logs m07l01-loop 2>&1 | grep -c Traceback
#   4
e='--format={{.Action}} {{.Actor.Attributes.exitCode}}'
w="--since 20s --until 0s"
docker events $w -f container=m07l01-loop "$e"
#   create <no value>
#   start <no value>
#   die 1
#   start <no value>
#   die 1
#   start <no value>
#   die 1
#   start <no value>
#   die 1
docker rm m07l01-loop
#   m07l01-loop
