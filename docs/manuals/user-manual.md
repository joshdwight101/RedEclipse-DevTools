# Red Eclipse Ultimate Developer Toolkit - Complete User Manual

## 1. Installation
### Windows
Run:
`powershell -ExecutionPolicy RemoteSigned -File installers/windows/install-devkit.ps1`

### Ubuntu
Run:
`sudo bash installers/ubuntu/install-devkit.sh`

## 2. Launcher Overview
The launcher exposes all tools and includes training-oriented labels.

### Core launcher actions
- Start Entire Suite
- Map Designer
- Mutator Builder
- Asset Pipeline
- Asset Manager
- Model Manager
- Variable Preset Manager
- Server Orchestrator
- Install In-Game Mod Menu
- Start IPC Bridge
- Open Web Dashboard
- Start Docker Server

## 3. Tool-by-tool command reference
### 3.1 Asset Manager
Command:
`pwsh -File src/powershell/Tools/AssetManager/Start-AssetManager.ps1 -Action scan|import|deploy -SourcePath <path> -AssetType models|textures|materials`

Examples:
- Scan assets:
  `pwsh -File src/powershell/Tools/AssetManager/Start-AssetManager.ps1 -Action scan`
- Import textures:
  `pwsh -File src/powershell/Tools/AssetManager/Start-AssetManager.ps1 -Action import -SourcePath ./incoming/textures -AssetType textures`
- Deploy manifest:
  `pwsh -File src/powershell/Tools/AssetManager/Start-AssetManager.ps1 -Action deploy`

### 3.2 Model Manager
Command:
`pwsh -File src/powershell/Tools/ModelManager/Start-ModelManager.ps1 -Action create-template|import-model|deploy-model -Name <modelName> -SourcePath <path>`

Examples:
- Create model template:
  `pwsh -File src/powershell/Tools/ModelManager/Start-ModelManager.ps1 -Action create-template -Name rocket_statue`
- Import model folder:
  `pwsh -File src/powershell/Tools/ModelManager/Start-ModelManager.ps1 -Action import-model -SourcePath ./fbx_export`
- Deploy model definitions:
  `pwsh -File src/powershell/Tools/ModelManager/Start-ModelManager.ps1 -Action deploy-model`

### 3.3 Variable Preset Manager
Command:
`pwsh -File src/powershell/Tools/VariablePresetManager/Start-VariablePresetManager.ps1 -PresetName <name>`

Creates cfg files that can be loaded in-game with `/exec presets/<name>.cfg`.

### 3.4 Mutator Builder
Command:
`pwsh -File src/powershell/Tools/MutatorBuilder/Start-MutatorBuilder.ps1 -Name <name> -Mode deathmatch|ctf|bomber-ball -Gravity <num> -Loadout <weapon>`

### 3.5 Map Designer
Command:
`pwsh -File src/powershell/Tools/MapDesigner/Start-MapDesigner.ps1 -MapFile <file.mpz>`

### 3.6 Server Orchestrator
Command:
`pwsh -File src/powershell/Tools/ServerOrchestrator/Start-ServerOrchestrator.ps1`

## 4. In-game Mod Menu
1. Install mod menu:
`pwsh -File scripts/modmenu/install-modmenu.ps1 -RedEclipseDataPath <your_game_data_path>`
2. In-game execute:
`/exec scripts/devkit_modmenu.cfg`
3. Open menu:
`/devkitmenu`
4. Load preset via command:
`/devkit_load_preset <presetName>` (via alias `devkit_load_preset`).

## 5. Training tips and developer growth path
- Start with Variable Preset Manager and inspect generated cfg outputs.
- Use Model Manager template mode to learn mapmodel config structure.
- Use Asset Manager deploy mode to understand content manifests.
- Progress to editing scripts directly in `src/powershell/Tools`.
- Add new launcher entries in:
  - Windows: `src/csharp/RedEclipse.DevKit.Windows.Launcher/Program.cs`
  - Linux: `src/linux/gui/devkit-launcher.sh`

## 6. Expanding the toolkit
- Add new PowerShell modules in `src/powershell/Modules`.
- Add a new tool script in `src/powershell/Tools/<ToolName>`.
- Register it in both launchers.
- Add documentation examples here and in README.

## 7. Power features
- Preset chaining: create master cfg files that `exec` multiple presets.
- Fast map test loops: run Map Designer then instantly load presets from mod menu.
- Team workflow: store presets in Git and version gameplay experiments.

## 8. Troubleshooting
- If launcher does not open tools, verify `pwsh` exists.
- If IPC bridge fails, run `npm install` in `src/ipc_bridge`.
- If Docker fails, ensure Docker service is running and user has permission.
