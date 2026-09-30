#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker run --rm m03l06-safe cat /status.txt
docker history --no-trunc m03l06-leak | grep -c s3cret
docker history --no-trunc m03l06-safe | grep -c s3cret
docker run --rm m03l06-safe ls /run/secrets
