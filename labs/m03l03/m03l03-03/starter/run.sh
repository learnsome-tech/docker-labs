#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker build -q -f forms.Dockerfile -t m03l03-forms . && docker run --rm m03l03-forms ls
