#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker compose ls -a -q --filter name=m06l04
docker compose -p m06l04-run-a down -v
docker compose -p m06l04-run-b down -v
docker compose ls -a -q --filter name=m06l04
docker image rm taskapi:m06l04
