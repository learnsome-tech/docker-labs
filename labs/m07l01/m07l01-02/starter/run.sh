#!/usr/bin/env bash
set -u
docker build -q -t m07l01-api . >/dev/null
docker run --name m07l01-bad -e PORT=eighty m07l01-api
lim="-m 32m --memory-swap 32m"
docker run --name m07l01-oom $lim alpine:3.22 tail /dev/zero
f='{{.State.ExitCode}} {{.State.OOMKilled}}'
docker inspect -f "$f" m07l01-bad m07l01-oom
docker rm m07l01-bad m07l01-oom
