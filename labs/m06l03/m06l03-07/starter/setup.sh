#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
ls
docker compose -f compose.yaml config | grep APP_VERSION
docker compose config | grep -E 'VERSION|host_ip|published'
docker compose build --quiet
docker compose up -d --wait
docker compose watch --no-up </dev/null >watch.log 2>&1 &
sleep 3
sed -i.bak 's/"ok"/"ok, live"/' app.py
sleep 6
curl -s localhost:18603/health -w '\n'
cat watch.log
kill $!
docker compose config --services
docker compose --profile tools config --services | sort
docker compose run --rm dbshell -tAc 'select 42'
mv app.py.bak app.py
docker compose down -v
docker image rm taskapi:m06l03
