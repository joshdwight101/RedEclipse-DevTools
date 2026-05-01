#!/usr/bin/env bash
set -euo pipefail

echo "[INFO] Installing Red Eclipse DevKit prerequisites on Ubuntu"
sudo apt-get update
sudo apt-get install -y powershell dotnet-sdk-8.0 nodejs npm docker.io docker-compose-plugin zenity

echo "[INFO] Enabling executable bits"
chmod +x src/linux/gui/devkit-launcher.sh src/linux/scripts/devkit-healthcheck.sh src/linux/scripts/devkit-start-all.sh

echo "[INFO] Install complete. Run: src/linux/gui/devkit-launcher.sh"
