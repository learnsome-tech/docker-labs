#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker build -q -f pipe.Dockerfile -t m03l03-pipe .
