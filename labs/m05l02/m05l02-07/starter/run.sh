#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
run="docker run -d --name m05l02-api -p 18502:8000"
$run -v m05l02-data:/data taskapi:m05l02; sleep 1
curl -sd '{"title":"keep me"}' localhost:18502/tasks; echo
docker rm -f m05l02-api && sh vol.sh backup m05l02-data
ls backup
docker volume rm m05l02-data && sh vol.sh restore m05l02-data
$run -v m05l02-data:/data taskapi:m05l02; sleep 1
curl -sd '{"title":"again"}' localhost:18502/tasks; echo
docker rm -f m05l02-api && docker volume rm m05l02-data
