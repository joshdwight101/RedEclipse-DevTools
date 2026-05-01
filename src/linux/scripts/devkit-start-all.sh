#!/usr/bin/env bash
set -euo pipefail

pushd src/ipc_bridge >/dev/null
npm install
npm start &
popd >/dev/null

docker compose -f docker/docker-compose.yml up -d --build
pwsh -File src/powershell/Core/Start-DevKit.ps1
