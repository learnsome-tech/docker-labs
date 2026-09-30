#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker run -d --name m04l04-registry -p 18404:5000 registry:3
I=localhost:18404/taskapi:1
docker buildx build -q --sbom=true -t $I --push .
docker buildx imagetools inspect $I
