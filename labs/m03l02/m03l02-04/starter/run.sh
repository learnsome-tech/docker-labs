#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker run --rm m03l02-api:1 stat -c '%u:%g %a %n' app.py
docker run --rm m03l02-api:1 stat -c '%u:%g %a %n' private.py
docker run --rm m03l02-api:1 pwd
