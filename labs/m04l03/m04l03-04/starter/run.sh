#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker build -q -t m04l03-lean -f lean.Dockerfile . >/dev/null && docker history m04l03-lean
