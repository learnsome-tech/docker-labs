#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
docker build -q -t m03l01-api:0.1 . && docker run --rm m03l01-api:0.1 sh -c 'pwd; ls -A'
mkdir -p .venv tmp && touch .venv/pyvenv.cfg
echo 'API_TOKEN=s3cr3t' > .env
head -c 30000000 /dev/urandom > tmp/cache.bin
export BUILDKIT_PROGRESS=plain
docker build -t m03l01-api:0.1 . 2>&1 | grep -o 'context: .*'
docker build -q -f ctx.Dockerfile -t m03l01-ctx . && docker run --rm m03l01-ctx find /ctx | sort
docker build -q -f ctx.Dockerfile -t m03l01-ctx . && docker run --rm m03l01-ctx find /ctx | sort
