# Red Eclipse DevKit Full Operations Manual

This manual explains installation, every major feature, and practical workflows.

## 1. Installation
### 1.1 Windows
1. Open elevated PowerShell.
2. Run `powershell -ExecutionPolicy RemoteSigned -File installers/windows/install-devkit.ps1`.
3. Build app binaries: `bash scripts/build-apps.sh` (Git Bash/WSL) or run equivalent dotnet publish commands.
4. Launch `RedEclipse.DevKit.Windows.Launcher`.

### 1.2 Ubuntu/Linux
1. Run `sudo bash installers/ubuntu/install-devkit.sh`.
2. Open launcher: `src/linux/gui/devkit-launcher.sh`.
3. Optional server deployment: `scripts/server/deploy/linux/deploy-redeclipse-server.sh`.

### 1.3 Unraid
1. Run `scripts/server/deploy/linux/deploy-unraid.sh` on Unraid host.
2. Review generated `.env` and `docker-compose.yml` under appdata path.

## 2. Tool Categories
- Content Authoring
- Map + Procedural Generation
- Variable and Mutator Systems
- Menu Design
- Server Management
- IPC + Dashboard

## 3. Content Authoring
### 3.1 ContentPipeline
Command:
`pwsh -File src/powershell/Tools/ContentPipeline/Start-ContentPipeline.ps1 -Action import-texture -SourcePath ./textures -Name cyberpack`

Actions:
- scan
- import-texture
- import-model
- import-entity-pack
- publish-map-kit

### 3.2 Content Studio App
Use tabs and hotkeys:
- Ctrl+1 textures
- Ctrl+2 models
- Ctrl+3 entities
- Ctrl+4 publish

## 4. Procedural and Map Workflows
### 4.1 Procedural World Builder
`pwsh -File src/powershell/Tools/ProceduralWorldBuilder/Start-ProceduralWorldBuilder.ps1 -Seed 7788 -Width 128 -Height 128 -EntityCount 256`

### 4.2 Map Designer
`pwsh -File src/powershell/Tools/MapDesigner/Start-MapDesigner.ps1 -MapFile mymap.mpz`

## 5. Variable + Mutator Workflows
### 5.1 Variable Presets
`pwsh -File src/powershell/Tools/VariablePresetManager/Start-VariablePresetManager.ps1 -PresetName movement_test`

### 5.2 Mutators
`pwsh -File src/powershell/Tools/MutatorBuilder/Start-MutatorBuilder.ps1 -Name lowgrav_ctf -Mode ctf -Gravity 55 -Loadout shotgun`

## 6. Menu Design Workflows
### 6.1 MenuDesigner App
`dotnet run --project src/csharp/RedEclipse.DevKit.MenuDesigner`
- enter menu name
- add button labels/commands
- generate cfg in `scripts/menus`
- optional direct game install

## 7. Server Management
### 7.1 Windows GUI Server Manager
- Create and start/stop multiple server entries.
- Refresh logs and parse player connection lines.
- Apply variable cfg directly for quick test cycles.
- Hotkeys: Ctrl+N/Ctrl+R/Ctrl+S/Ctrl+L/Ctrl+V.

### 7.2 Linux PowerShell ServerManager
`pwsh -File src/powershell/Tools/ServerManager/Start-ServerManager.ps1 -Action create -Name sandboxA`
`pwsh -File src/powershell/Tools/ServerManager/Start-ServerManager.ps1 -Action start -Name sandboxA`

## 8. IPC and Dashboard
- IPC Bridge start: `cd src/ipc_bridge && npm install && npm start`
- Dashboard launcher: `pwsh -File src/launcher/launch-kiosk.ps1`

## 9. Collaboration and Versioning
- Save and share project configs via `RedEclipse.DevKit.Cli` (`*.devkit.json`).
- Track suite version in `VERSION`.
- Track updates in `CHANGELOG.md` and component changelogs.
