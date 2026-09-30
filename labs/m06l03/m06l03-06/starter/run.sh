#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker compose config --services
docker compose --profile tools config --services | sort
docker compose run --rm dbshell -tAc 'select 42'
mv app.py.bak app.py
docker compose down -v
docker image rm taskapi:m06l03
