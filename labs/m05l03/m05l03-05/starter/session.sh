#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker network ls --filter name=m05l03
#   NETWORK ID     NAME         DRIVER    SCOPE
#   3cbafe91e440   m05l03-net   bridge    local
docker network inspect -f '{{len .Containers}}' m05l03-net
#   2
docker network rm m05l03-net 2>&1 | cut -d'(' -f1
#   Error response from daemon: error while removing network: network m05l03-net has active endpoints 
#   exit status 1
docker rm -f m05l03-api m05l03-cli
#   m05l03-api
#   m05l03-cli
docker network rm m05l03-net
#   m05l03-net
