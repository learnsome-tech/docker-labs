#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker build --build-arg API_TOKEN=s3cret -t m03l06-leak leak
