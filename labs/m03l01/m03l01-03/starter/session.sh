#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

mkdir -p .venv tmp && touch .venv/pyvenv.cfg
echo 'API_TOKEN=s3cr3t' > .env
head -c 30000000 /dev/urandom > tmp/cache.bin
export BUILDKIT_PROGRESS=plain
docker build -t m03l01-api:0.1 . 2>&1 | grep -o 'context: .*'
#   context: 2B done
#   context: 28B done
