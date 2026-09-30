#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker build -q -f add.Dockerfile -t m03l02-add . && docker run --rm m03l02-add find | sort
