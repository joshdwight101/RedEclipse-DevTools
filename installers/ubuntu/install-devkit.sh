#!/usr/bin/env bash
set -euo pipefail

echo "[INFO] Installing Red Eclipse DevKit prerequisites on Ubuntu"
sudo apt-get update
sudo apt-get install -y powershell dotnet-sdk-8.0 nodejs npm docker.io docker-compose-plugin

echo "[INFO] Install complete. Run: pwsh -File src/powershell/Core/Start-DevKit.ps1"
