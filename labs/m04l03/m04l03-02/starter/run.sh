#!/usr/bin/env bash
set -u
F='{{.Repository}}:{{.Tag}} {{.Size}}'
docker images --format "$F" debian:13
docker images --format "$F" python:3.12-alpine
docker images --format "$F" alpine:3.22
docker images --format "$F" busybox:1.37
docker images --format "$F" gcr.io/distroless/static-debian12
docker run --rm debian:13 sh -c 'ls /usr/bin | wc -l'
docker run --rm alpine:3.22 sh -c 'ls /usr/bin | wc -l'
