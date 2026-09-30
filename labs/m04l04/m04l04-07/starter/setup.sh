#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
docker build -q -t m04l04-taskapi:1 .
docker run --rm m04l04-taskapi:1 cat /etc/alpine-release
docker scout sbom --format list m04l04-taskapi:1 2>/dev/null
docker run -d --name m04l04-registry -p 18404:5000 registry:3
I=localhost:18404/taskapi:1
docker buildx build -q --sbom=true -t $I --push .
docker buildx imagetools inspect $I
T="docker buildx imagetools inspect localhost:18404/taskapi:1"
$T --format '{{json .SBOM}}' >s.json
jq '.SPDX.packages | length' s.json
$T --format '{{json .Provenance}}' >p.json
jq -r '..|.uri? // empty' p.json
jq -r '..|.sha256? // empty' p.json
docker image inspect -f '{{.Id}}' python:3.12-alpine
docker rm -f m04l04-registry
docker rmi localhost:18404/taskapi:1
