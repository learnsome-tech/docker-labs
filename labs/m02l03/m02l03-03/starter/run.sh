#!/usr/bin/env bash
set -u
docker exec command-demo ps
docker exec command-demo true
docker top command-demo
