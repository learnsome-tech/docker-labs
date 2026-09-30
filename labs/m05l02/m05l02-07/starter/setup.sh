#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
docker build -q -t taskapi:m05l02 . >/dev/null
mkdir data
run="docker run -d --name m05l02-api -p 18502:8000"
$run -v ./data:/data taskapi:m05l02; sleep 1
curl -sd '{"title":"on disk"}' localhost:18502/tasks; echo
cat data/tasks.json; echo
docker rm -f m05l02-api
docker run --rm -v ./data:/data:ro alpine:3.20 touch /data/x
docker run --rm -v ./typo:/n alpine:3.20 true && ls
docker run --mount type=bind,src=/typo,dst=/n alpine:3.20
rmdir typo
img=taskapi:m05l02
docker run --rm $img id
docker run --rm -v m05l02-seed:/data $img stat -c %u /data
docker run --rm -v m05l02-new:/out $img touch /out/x
docker run --rm -v m05l02-new:/out $img stat -c %u /out
docker run --rm -u 0 -v m05l02-new:/out $img chown 10001 /out
docker run --rm -v m05l02-new:/out $img touch /out/x
docker volume rm m05l02-seed m05l02-new
