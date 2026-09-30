#!/usr/bin/env bash
set -u
docker run -d --name taskapi-demo -p 18080:8000 taskapi:0.1
curl -s http://localhost:18080/health
docker ps --filter name=taskapi-demo
