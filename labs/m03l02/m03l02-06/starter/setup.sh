#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
docker build -q -t m03l02-api:1 . && docker run --rm m03l02-api:1 find /opt | sort
docker run --rm m03l02-api:1 stat -c '%u:%g %a %n' app.py
docker run --rm m03l02-api:1 stat -c '%u:%g %a %n' private.py
docker run --rm m03l02-api:1 pwd
docker build -q -f add.Dockerfile -t m03l02-add . && docker run --rm m03l02-add find | sort
