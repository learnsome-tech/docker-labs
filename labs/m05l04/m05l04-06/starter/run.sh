#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker inspect -f '{{.Config.ExposedPorts}}' taskapi:m05l04
docker run -d --name m05l04-auto -P taskapi:m05l04
hp=$(docker port m05l04-auto 8000/tcp | sed -n 1p)
sleep 1; curl -s $hp/health; echo
docker rm -f m05l04-auto
