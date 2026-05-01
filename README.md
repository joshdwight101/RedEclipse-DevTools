# Red Eclipse Ultimate Developer Toolkit

One-command installers for Windows and Linux plus launcher GUI and procedural generation tooling for fast visual world-building.

## Quick Install
### Windows
`powershell -ExecutionPolicy RemoteSigned -File installers/windows/install-devkit.ps1`

### Ubuntu
`sudo bash installers/ubuntu/install-devkit.sh`

## Core Builder Applications
- Asset Manager: import/scan/deploy assets.
- Model Manager: create model templates, import models, deploy mapmodel cfg.
- Variable Preset Manager: generate cfg presets for physics/weapons/environment.
- Procedural World Builder: generate world seeds + entity layouts for map bootstrap.
- In-Game Mod Menu: load generated presets on demand.

## Procedural Generation + Visual Editing
- Scripted generation: `src/powershell/Tools/ProceduralWorldBuilder/Start-ProceduralWorldBuilder.ps1`
- Visual terrain preview/editor helper: `src/frontend/procgen/index.html`
- Guide: `docs/guides/procgen/procedural-world-builder.md`

## In-game integration
1. Install mod menu:
`pwsh -File scripts/modmenu/install-modmenu.ps1 -RedEclipseDataPath <game_data_path>`
2. In game execute:
`/exec scripts/devkit_modmenu.cfg`
3. Open menu:
`/devkitmenu`

## Full Manual
Read complete command/feature training and expansion guide:
`docs/manuals/user-manual.md`
