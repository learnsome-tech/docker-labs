#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

cat base/Dockerfile
#   ARG TAG=3.20
#   FROM alpine:${TAG}
#   CMD ["sh", "-c", "cat /etc/alpine-release; apk info -v 2>/dev/null | grep -E '^(libssl3|musl)-[0-9]'"]
docker build -q -t m04l04-base:old base
#   sha256:f1fcb27d84d02cd42815001123c49e8f981f32871e08187cea147b0233974b75
docker run --rm m04l04-base:old
#   3.20.10
#   libssl3-3.3.7-r0
#   musl-1.2.5-r3
docker build -q -t m04l04-base:new --build-arg TAG=3.22 base
#   sha256:4f920a3870b85dab0839abda252c131d49e08bcc7f829f0ba78eebfafab14c6e
docker run --rm m04l04-base:new
#   3.22.5
#   libssl3-3.5.7-r0
#   musl-1.2.5-r12
docker rmi m04l04-base:old m04l04-base:new m04l04-taskapi:1
#   Untagged: m04l04-base:old
#   Deleted: sha256:f1fcb27d84d02cd42815001123c49e8f981f32871e08187cea147b0233974b75
#   Untagged: m04l04-base:new
#   Deleted: sha256:4f920a3870b85dab0839abda252c131d49e08bcc7f829f0ba78eebfafab14c6e
#   Untagged: m04l04-taskapi:1
#   Deleted: sha256:d63421b49a51c38fcfcab9423a230e3154cff09c24db56f13e0b8d08811d3e78
