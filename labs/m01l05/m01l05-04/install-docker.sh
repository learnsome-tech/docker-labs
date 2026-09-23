#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m01l05 — Install Docker And Verify Your Environment
# https://learnsome.tech/courses/docker-course/watch?lesson=m01l05
# © LearnSome.tech
set -euo pipefail

# 1. the convenience script, for a machine you can rebuild
curl -fsSL https://get.docker.com | sudo sh

# 2. let your user talk to the daemon socket
sudo usermod -aG docker "$USER"
newgrp docker

# 3. start it now, and on every boot
sudo systemctl enable --now docker

# 4. prove it
docker run --rm hello-world
