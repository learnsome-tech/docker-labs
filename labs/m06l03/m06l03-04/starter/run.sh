#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker compose build --quiet
docker compose up -d --wait
docker compose watch --no-up </dev/null >watch.log 2>&1 &
sleep 3
sed -i.bak 's/"ok"/"ok, live"/' app.py
sleep 6
curl -s localhost:18603/health -w '\n'
cat watch.log
kill $!
