#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
T="docker buildx imagetools inspect localhost:18404/taskapi:1"
$T --format '{{json .SBOM}}' >s.json
jq '.SPDX.packages | length' s.json
$T --format '{{json .Provenance}}' >p.json
jq -r '..|.uri? // empty' p.json
jq -r '..|.sha256? // empty' p.json
docker image inspect -f '{{.Id}}' python:3.12-alpine
docker rm -f m04l04-registry
docker rmi localhost:18404/taskapi:1
