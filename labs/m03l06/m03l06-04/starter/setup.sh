#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
docker build -q -t m03l06-worker . >/dev/null && docker run --rm -e QUEUE=emails m03l06-worker
docker image ls golang:1.23-alpine
docker image ls m03l06-worker
docker history m03l06-worker
docker build -q --target test -t m03l06-test .
docker run --rm m03l06-test cat /out/vet.txt
