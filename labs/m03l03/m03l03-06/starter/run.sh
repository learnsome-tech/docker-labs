#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
export BUILDKIT_PROGRESS=plain
b() { docker build -t m03l03-api . 2>&1; }
b | grep -c CACHED
touch app.py && b | grep -c CACHED
echo "# $(date)" >> app.py
b | grep -B1 DONE | grep -o '\[./5].*'
b | grep -c CACHED
