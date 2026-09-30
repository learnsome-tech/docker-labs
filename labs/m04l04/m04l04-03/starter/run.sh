#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker scout cves m04l04-taskapi:1
