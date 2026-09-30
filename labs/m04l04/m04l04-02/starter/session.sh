#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker build -q -t m04l04-taskapi:1 .
#   sha256:d63421b49a51c38fcfcab9423a230e3154cff09c24db56f13e0b8d08811d3e78
docker run --rm m04l04-taskapi:1 cat /etc/alpine-release
#   3.24.1
docker scout sbom --format list m04l04-taskapi:1 2>/dev/null
#             Name          │     Version      │  Type   
#   ...
#    libcrypto3             │ 3.5.8-r0         │ apk     
#   ...
#    libssl3                │ 3.5.8-r0         │ apk     
#   ...
#    musl                   │ 1.2.6-r2         │ apk     
#   ...
#    openssl                │ 3.5.8-r0         │ apk     
#    pax-utils              │ 1.3.9-r1         │ apk     
#    pip                    │ 25.0.1           │ pypi    
#    python                 │ 3.12.14          │ generic 
#   ...
