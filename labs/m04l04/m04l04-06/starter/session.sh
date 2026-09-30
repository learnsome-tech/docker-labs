#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

T="docker buildx imagetools inspect localhost:18404/taskapi:1"
$T --format '{{json .SBOM}}' >s.json
jq '.SPDX.packages | length' s.json
#   47
$T --format '{{json .Provenance}}' >p.json
jq -r '..|.uri? // empty' p.json
#   pkg:docker/docker/buildkit-syft-scanner@stable-1?platform=linux%2Farm64
#   pkg:docker/python@3.12-alpine?platform=linux%2Farm64
jq -r '..|.sha256? // empty' p.json
#   ae4f3b554449e7e25548e7d8ccc029d17357348e30c6e3df01b92bc93654d6a9
#   b64631e04e4920160c50fbe8d8df828f7f35f06f425cb44aa09bca53e708a35a
docker image inspect -f '{{.Id}}' python:3.12-alpine
#   sha256:b64631e04e4920160c50fbe8d8df828f7f35f06f425cb44aa09bca53e708a35a
docker rm -f m04l04-registry
#   m04l04-registry
docker rmi localhost:18404/taskapi:1
#   Untagged: localhost:18404/taskapi:1
#   Deleted: sha256:29a1f3cf78ac0eeaf079fa0ba80bb451d97e69ac828ff9d50bde694492546423
