#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker network ls --filter name=m05l03
docker network inspect -f '{{len .Containers}}' m05l03-net
docker network rm m05l03-net 2>&1 | cut -d'(' -f1
docker rm -f m05l03-api m05l03-cli
docker network rm m05l03-net
