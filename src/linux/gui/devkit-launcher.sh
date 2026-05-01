#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/../../.." && pwd)"
cd "$ROOT_DIR"

if ! command -v zenity >/dev/null 2>&1; then
  echo "zenity not found. Install zenity for GUI mode." >&2
  exit 1
fi

choice=$(zenity --list --title="Red Eclipse DevKit" --width=480 --height=420 --column="Launcher" \
  "Start Entire Suite" "Map Designer" "Mutator Builder" "Asset Pipeline" "Server Orchestrator" "Start IPC Bridge" "Open Web Dashboard" "Start Docker Server")

case "$choice" in
  "Start Entire Suite") src/linux/scripts/devkit-start-all.sh ;;
  "Map Designer") pwsh -File src/powershell/Tools/MapDesigner/Start-MapDesigner.ps1 -MapFile "example.mpz" ;;
  "Mutator Builder") pwsh -File src/powershell/Tools/MutatorBuilder/Start-MutatorBuilder.ps1 ;;
  "Asset Pipeline") pwsh -File src/powershell/Tools/AssetPipeline/Start-AssetPipeline.ps1 ;;
  "Server Orchestrator") pwsh -File src/powershell/Tools/ServerOrchestrator/Start-ServerOrchestrator.ps1 ;;
  "Start IPC Bridge") (cd src/ipc_bridge && npm start) ;;
  "Open Web Dashboard") pwsh -File src/launcher/launch-kiosk.ps1 ;;
  "Start Docker Server") docker compose -f docker/docker-compose.yml up --build ;;
esac
