#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
ls
docker compose -f compose.yaml config | grep APP_VERSION
docker compose config | grep -E 'VERSION|host_ip|published'
