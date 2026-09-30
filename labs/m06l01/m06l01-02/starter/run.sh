#!/usr/bin/env bash
set -u
ls
docker compose config --services
docker compose config --images | sort
