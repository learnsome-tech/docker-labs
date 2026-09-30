#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker run --rm -v ./data:/data:ro alpine:3.20 touch /data/x
docker run --rm -v ./typo:/n alpine:3.20 true && ls
docker run --mount type=bind,src=/typo,dst=/n alpine:3.20
rmdir typo
