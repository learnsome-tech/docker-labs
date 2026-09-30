#!/usr/bin/env bash
set -u
ls
docker compose -f race.yaml run --rm migrate; echo $?
docker compose -f race.yaml down -v
