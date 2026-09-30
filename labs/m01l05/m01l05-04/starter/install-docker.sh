#!/usr/bin/env bash
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
