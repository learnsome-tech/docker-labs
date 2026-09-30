#!/usr/bin/env bash
set -u
ls
docker compose -f compose.yaml config | grep APP_VERSION
docker compose config | grep -E 'VERSION|host_ip|published'
