#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker build -q -t m07l01-api . >/dev/null
docker run --name m07l01-bad -e PORT=eighty m07l01-api
#   Traceback (most recent call last):
#   ...
#   ValueError: invalid literal for int() with base 10: 'eighty'
lim="-m 32m --memory-swap 32m"
docker run --name m07l01-oom $lim alpine:3.22 tail /dev/zero
f='{{.State.ExitCode}} {{.State.OOMKilled}}'
docker inspect -f "$f" m07l01-bad m07l01-oom
#   1 false
#   137 true
docker rm m07l01-bad m07l01-oom
#   m07l01-bad
#   m07l01-oom
