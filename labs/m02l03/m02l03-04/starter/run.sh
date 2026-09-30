#!/usr/bin/env bash
set -u
docker run --name exit-demo alpine:3.20 false; echo code:0$?
docker inspect exit-demo --format '{{.State.ExitCode}}'
docker rm exit-demo
