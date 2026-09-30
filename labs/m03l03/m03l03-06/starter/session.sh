#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

export BUILDKIT_PROGRESS=plain
b() { docker build -t m03l03-api . 2>&1; }
b | grep -c CACHED
#   4
touch app.py && b | grep -c CACHED
#   4
echo "# $(date)" >> app.py
b | grep -B1 DONE | grep -o '\[./5].*'
#   [4/5] COPY app.py .
#   [5/5] RUN mkdir -p /data && chown app /data
b | grep -c CACHED
#   4
