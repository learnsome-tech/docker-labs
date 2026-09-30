#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker run -d --name m07l02-reg -p 18702:5000 registry:3
#   d8485a1c0ba71e54f306984accf7feac242525ac0207d1f07e65951bc2e972cd
reg=localhost:18702/taskapi
sha=4d7c1e9
docker build -q -t $reg:$sha .
#   sha256:e30ef7a9e6474813d3a0b77c0c290a585df4e10f4ab8144590c225332d91721b
docker push -q $reg:$sha
#   localhost:18702/taskapi:4d7c1e9
docker inspect -f '{{index .RepoDigests 0}}' $reg:$sha
#   localhost:18702/taskapi@sha256:e30ef7a9e6474813d3a0b77c0c290a585df4e10f4ab8144590c225332d91721b
