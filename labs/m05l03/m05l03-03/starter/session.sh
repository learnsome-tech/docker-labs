#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker network create m05l03-net
#   3cbafe91e440928e5064184f046015f2a15fca223a01c75c2010da436c6b514a
docker network disconnect bridge m05l03-api
docker network connect --alias tasks m05l03-net m05l03-api
docker run -dit --name m05l03-cli alpine:3.20
#   8dcf3cf6fc0a5bb496c65419bcd11b253d674e00d81c2a7984d1836501311a41
docker exec m05l03-cli ping -c1 -W1 m05l03-api
#   ping: bad address 'm05l03-api'
docker network connect m05l03-net m05l03-cli
docker exec m05l03-cli wget -qO- m05l03-api:8000/health; echo
#   {"status": "ok", "version": "1.0.0"}
docker exec m05l03-cli wget -qO- tasks:8000/health; echo
#   {"status": "ok", "version": "1.0.0"}
docker exec m05l03-cli grep nameserver /etc/resolv.conf
#   nameserver 127.0.0.11
