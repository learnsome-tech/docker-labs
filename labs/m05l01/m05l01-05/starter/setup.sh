#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
docker build -q -t taskapi:m05l01 . >/dev/null
run="docker run -d --name m05l01-api -p 18501:8000"
$run taskapi:m05l01; sleep 1
curl -sd '{"title":"ship it"}' localhost:18501/tasks; echo
docker rm -f m05l01-api
$run taskapi:m05l01; sleep 1
curl -s localhost:18501/tasks; echo
docker rm -f m05l01-api
docker volume create m05l01-data
run="docker run -d --name m05l01-api -p 18501:8000"
$run -v m05l01-data:/data taskapi:m05l01; sleep 1
curl -sd '{"title":"ship it"}' localhost:18501/tasks; echo
docker rm -f m05l01-api
$run -v m05l01-data:/data taskapi:m05l01; sleep 1
curl -s localhost:18501/tasks; echo
docker rm -f m05l01-api
