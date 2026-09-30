#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
ls
docker compose -f race.yaml run --rm migrate; echo $?
docker compose -f race.yaml down -v
