#!/usr/bin/env bash
set -euo pipefail

echo "[health] checking node"
command -v node >/dev/null

echo "[health] checking docker"
command -v docker >/dev/null

echo "[health] checking powershell"
command -v pwsh >/dev/null

echo "[health] all required components detected"
