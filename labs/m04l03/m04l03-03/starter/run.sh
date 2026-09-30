#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker build -q -t m04l03-fat -f fat.Dockerfile . >/dev/null && docker history m04l03-fat
