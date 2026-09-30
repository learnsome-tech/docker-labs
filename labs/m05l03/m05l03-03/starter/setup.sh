#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
docker build -q -t taskapi:m05l03 . >/dev/null
docker run -d --name m05l03-api taskapi:m05l03
docker inspect -f '{{.HostConfig.NetworkMode}}' m05l03-api
docker run --rm alpine:3.20 ping -c1 -W1 m05l03-api
ip=$(docker exec m05l03-api hostname -i); echo $ip
docker run --rm alpine:3.20 wget -qO- $ip:8000/health; echo
