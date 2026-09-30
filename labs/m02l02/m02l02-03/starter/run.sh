#!/usr/bin/env bash
set -u
docker stop lifecycle-demo
docker ps -a --filter name=lifecycle-demo
docker start -a lifecycle-demo
