#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker volume create m05l01-data
run="docker run -d --name m05l01-api -p 18501:8000"
$run -v m05l01-data:/data taskapi:m05l01; sleep 1
curl -sd '{"title":"ship it"}' localhost:18501/tasks; echo
docker rm -f m05l01-api
$run -v m05l01-data:/data taskapi:m05l01; sleep 1
curl -s localhost:18501/tasks; echo
docker rm -f m05l01-api
