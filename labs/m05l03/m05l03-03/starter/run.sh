#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker network create m05l03-net
docker network disconnect bridge m05l03-api
docker network connect --alias tasks m05l03-net m05l03-api
docker run -dit --name m05l03-cli alpine:3.20
docker exec m05l03-cli ping -c1 -W1 m05l03-api
docker network connect m05l03-net m05l03-cli
docker exec m05l03-cli wget -qO- m05l03-api:8000/health; echo
docker exec m05l03-cli wget -qO- tasks:8000/health; echo
docker exec m05l03-cli grep nameserver /etc/resolv.conf
