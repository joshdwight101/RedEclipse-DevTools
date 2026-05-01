# Red Eclipse Ultimate Developer Toolkit

One-command installers for Windows and Linux plus a launcher GUI that can run the complete suite: asset import/development/deployment, model workflows, variable preset generation, mod menu install, IPC bridge, dashboard, and server runtime.

## Quick Install
### Windows
`powershell -ExecutionPolicy RemoteSigned -File installers/windows/install-devkit.ps1`

### Ubuntu
`sudo bash installers/ubuntu/install-devkit.sh`

## New flagship applications
- Asset Manager (`src/powershell/Tools/AssetManager`): scan, import, deploy manifest.
- Model Manager (`src/powershell/Tools/ModelManager`): create templates, import models, generate deployment cfg.
- Variable Preset Manager (`src/powershell/Tools/VariablePresetManager`): generate gameplay/physics/weapon cfg presets.
- In-Game Mod Menu (`scripts/modmenu/devkit_modmenu.cfg`): load preset cfg files on demand in-game.

## In-game integration
1. Install mod menu:
   `pwsh -File scripts/modmenu/install-modmenu.ps1 -RedEclipseDataPath <game_data_path>`
2. In game:
   - `/exec scripts/devkit_modmenu.cfg`
   - `/devkitmenu`

## User Manual
A complete manual with every command, examples, power workflows, and expansion path is in:
`docs/manuals/user-manual.md`

## Launcher GUI capabilities
- Start entire suite
- Launch all creation tools (map, mutator, assets, models, presets)
- Install in-game mod menu
- Start IPC bridge
- Open web dashboard
- Start Docker server runtime

## Project Structure
- `src/csharp/RedEclipse.DevKit.Windows.*` Windows native launcher/apps.
- `src/linux/gui` Linux launcher GUI.
- `src/powershell/Tools` core no-code app scripts.
- `scripts/modmenu` in-game menu integration.
- `scripts/presets` generated and sample preset cfg files.
- `docs/manuals` comprehensive training and reference docs.
