#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker build -q -f ctx.Dockerfile -t m03l01-ctx . && docker run --rm m03l01-ctx find /ctx | sort
