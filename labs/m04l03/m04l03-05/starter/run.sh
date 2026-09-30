#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker build -q -t m04l03-worker -f go.Dockerfile . >/dev/null && docker images m04l03-worker
