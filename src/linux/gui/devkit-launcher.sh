#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/../../.." && pwd)"
cd "$ROOT_DIR"

if ! command -v zenity >/dev/null 2>&1; then
  echo "zenity not found. Install zenity for GUI mode." >&2
  exit 1
fi

choice=$(zenity --list --title="Red Eclipse DevKit" --width=560 --height=500 --column="Launcher" \
  "Start Entire Suite" "Map Designer" "Mutator Builder" "Asset Pipeline" "Asset Manager" "Model Manager" "Variable Preset Manager" "Procedural World Builder" "Server Orchestrator" "Install In-Game Mod Menu" "Start IPC Bridge" "Open Web Dashboard" "Start Docker Server")

case "$choice" in
  "Start Entire Suite") src/linux/scripts/devkit-start-all.sh ;;
  "Map Designer") pwsh -File src/powershell/Tools/MapDesigner/Start-MapDesigner.ps1 -MapFile "example.mpz" ;;
  "Mutator Builder") pwsh -File src/powershell/Tools/MutatorBuilder/Start-MutatorBuilder.ps1 ;;
  "Asset Pipeline") pwsh -File src/powershell/Tools/AssetPipeline/Start-AssetPipeline.ps1 ;;
  "Asset Manager") pwsh -File src/powershell/Tools/AssetManager/Start-AssetManager.ps1 ;;
  "Model Manager") pwsh -File src/powershell/Tools/ModelManager/Start-ModelManager.ps1 ;;
  "Variable Preset Manager") pwsh -File src/powershell/Tools/VariablePresetManager/Start-VariablePresetManager.ps1 ;;
  "Procedural World Builder") pwsh -File src/powershell/Tools/ProceduralWorldBuilder/Start-ProceduralWorldBuilder.ps1 ;;
  "Server Orchestrator") pwsh -File src/powershell/Tools/ServerOrchestrator/Start-ServerOrchestrator.ps1 ;;
  "Install In-Game Mod Menu") zenity --entry --title="Install Mod Menu" --text="Red Eclipse data path:" | xargs -I{} pwsh -File scripts/modmenu/install-modmenu.ps1 -RedEclipseDataPath "{}" ;;
  "Start IPC Bridge") (cd src/ipc_bridge && npm start) ;;
  "Open Web Dashboard") pwsh -File src/launcher/launch-kiosk.ps1 ;;
  "Start Docker Server") docker compose -f docker/docker-compose.yml up --build ;;
esac
