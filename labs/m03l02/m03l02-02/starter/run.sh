#!/usr/bin/env bash
set -u
docker build -q -t m03l02-api:1 . && docker run --rm m03l02-api:1 find /opt | sort
