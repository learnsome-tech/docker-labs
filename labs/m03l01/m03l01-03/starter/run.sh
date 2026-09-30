#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
mkdir -p .venv tmp && touch .venv/pyvenv.cfg
echo 'API_TOKEN=s3cr3t' > .env
head -c 30000000 /dev/urandom > tmp/cache.bin
export BUILDKIT_PROGRESS=plain
docker build -t m03l01-api:0.1 . 2>&1 | grep -o 'context: .*'
