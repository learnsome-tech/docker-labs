#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker compose build --quiet
#    Image taskapi:m06l03 Building
#    Image taskapi:m06l03 Built
docker compose up -d --wait
#   ...
#    Container m06l03-stack-api-1 Healthy
docker compose watch --no-up </dev/null >watch.log 2>&1 &
sleep 3
sed -i.bak 's/"ok"/"ok, live"/' app.py
sleep 6
curl -s localhost:18603/health -w '\n'
#   {"status": "ok, live", "version": "dev"}
cat watch.log
#   Watch enabled
#   Syncing service "api" after 1 changes were detected
#    Container m06l03-stack-api-1 Restarting
#    Container m06l03-stack-api-1 Started
#   service(s) ["api"] restarted
kill $!
