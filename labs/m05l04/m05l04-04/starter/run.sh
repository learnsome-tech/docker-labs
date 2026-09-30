#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
srv="python:3.12-alpine python -m http.server 8000 -b"
docker run -d --name m05l04-bad -p 18504:8000 $srv 127.0.0.1
sleep 1; curl -sS localhost:18504/; echo "exit $?"
docker exec m05l04-bad netstat -tln
docker exec m05l04-bad wget -qO- 127.0.0.1:8000 | sed -n 1p
docker rm -f m05l04-bad
docker run -d --name m05l04-good -p 18504:8000 $srv 0.0.0.0
sleep 1; curl -s localhost:18504/ | sed -n 1p
docker rm -f m05l04-good
