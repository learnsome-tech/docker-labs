#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker build -q -t m04l03-taskapi .
#   sha256:72cf6b9d93f4796961f93ab3048a0923850e3ed7abcd86b46ce62ecf7401f268
docker run --rm python:3.12-alpine id -un
#   root
docker run --rm m04l03-taskapi id
#   uid=10001(app) gid=10001(app) groups=10001(app)
docker run --rm m04l03-taskapi touch /app/x
#   touch: /app/x: Permission denied
docker run --rm m04l03-taskapi touch /data/x
docker run --rm --user 0 m04l03-taskapi id -u
#   0
docker run --rm m04l03-worker
#   task worker ready
#   queue:
docker image inspect -f '{{.Config.User}}' m04l03-worker
#   nonroot
docker rmi m04l03-taskapi m04l03-worker m04l03-fat m04l03-lean
#   Untagged: m04l03-taskapi:latest
#   Deleted: sha256:72cf6b9d93f4796961f93ab3048a0923850e3ed7abcd86b46ce62ecf7401f268
#   Untagged: m04l03-worker:latest
#   Deleted: sha256:ac1f990e29bd10d5f215136f1cee544c79fe8ad6d9cd0ff873a97b3fac6872a2
#   Untagged: m04l03-fat:latest
#   Deleted: sha256:0f94466c6abf868100cfcba44547006f3940d888c08e67736ec6923149212413
#   Untagged: m04l03-lean:latest
#   Deleted: sha256:8b54abfda488963d28a6c7e6eb1c7b0235a3529c24d893cea6cf81082358657e
