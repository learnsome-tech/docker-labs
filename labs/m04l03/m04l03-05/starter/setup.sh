#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
F='{{.Repository}}:{{.Tag}} {{.Size}}'
docker images --format "$F" debian:13
docker images --format "$F" python:3.12-alpine
docker images --format "$F" alpine:3.22
docker images --format "$F" busybox:1.37
docker images --format "$F" gcr.io/distroless/static-debian12
docker run --rm debian:13 sh -c 'ls /usr/bin | wc -l'
docker run --rm alpine:3.22 sh -c 'ls /usr/bin | wc -l'
docker build -q -t m04l03-fat -f fat.Dockerfile . >/dev/null && docker history m04l03-fat
docker build -q -t m04l03-lean -f lean.Dockerfile . >/dev/null && docker history m04l03-lean
