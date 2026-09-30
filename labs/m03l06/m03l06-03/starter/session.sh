#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker image ls golang:1.23-alpine
#   IMAGE                ID             DISK USAGE   CONTENT SIZE   EXTRA
#   golang:1.23-alpine   383395b794df        365MB         75.4MB
docker image ls m03l06-worker
#   IMAGE                  ID             DISK USAGE   CONTENT SIZE   EXTRA
#   m03l06-worker:latest   37075be9797e       9.58MB         1.96MB
docker history m03l06-worker
#   IMAGE          CREATED        CREATED BY                                      SIZE      COMMENT
#   37075be9797e   1 second ago   ENTRYPOINT ["/worker"]                          0B        buildkit.dockerfile.v0
#   <missing>      1 second ago   USER nonroot                                    0B        buildkit.dockerfile.v0
#   <missing>      1 second ago   COPY /out/worker /worker # buildkit             2.16MB    buildkit.dockerfile.v0
#   ...
docker build -q --target test -t m03l06-test .
#   sha256:e5d4576334a402d75ce6317f52469c93fceafd4bfce848ab1afbb2e43e0e4c84
docker run --rm m03l06-test cat /out/vet.txt
#   vet passed
