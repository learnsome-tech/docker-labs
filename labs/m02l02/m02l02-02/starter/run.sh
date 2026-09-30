#!/usr/bin/env bash
set -u
docker create --name lifecycle-demo alpine:3.20 sleep 30
docker start lifecycle-demo
docker ps --filter name=lifecycle-demo
