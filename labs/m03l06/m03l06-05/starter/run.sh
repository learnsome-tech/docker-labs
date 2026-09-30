#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
API_TOKEN=s3cret docker build -q --secret id=API_TOKEN -t m03l06-safe safe
