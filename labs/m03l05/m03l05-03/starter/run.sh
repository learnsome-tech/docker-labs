#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker run --rm m03l05-api stat -c '%U %n' /app /data
docker run --rm m03l05-api touch /app/x
docker run --rm m03l05-api touch /data/x
docker run --rm -u root m03l05-api id -un
