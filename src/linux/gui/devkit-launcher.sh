#!/usr/bin/env bash
set -euo pipefail

if ! command -v zenity >/dev/null 2>&1; then
  echo "zenity not found. Install zenity for GUI mode." >&2
  exit 1
fi

choice=$(zenity --list --title="Red Eclipse DevKit" --column="Mini Apps" \
  "Map Designer" "Mutator Builder" "Asset Pipeline" "Server Orchestrator" "Start Core")

case "$choice" in
  "Map Designer") pwsh -File src/powershell/Tools/MapDesigner/Start-MapDesigner.ps1 -MapFile "example.mpz" ;;
  "Mutator Builder") pwsh -File src/powershell/Tools/MutatorBuilder/Start-MutatorBuilder.ps1 ;;
  "Asset Pipeline") pwsh -File src/powershell/Tools/AssetPipeline/Start-AssetPipeline.ps1 ;;
  "Server Orchestrator") pwsh -File src/powershell/Tools/ServerOrchestrator/Start-ServerOrchestrator.ps1 ;;
  "Start Core") pwsh -File src/powershell/Core/Start-DevKit.ps1 ;;
esac
