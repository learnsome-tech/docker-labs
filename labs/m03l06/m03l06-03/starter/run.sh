#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker image ls golang:1.23-alpine
docker image ls m03l06-worker
docker history m03l06-worker
docker build -q --target test -t m03l06-test .
docker run --rm m03l06-test cat /out/vet.txt
