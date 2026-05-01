# Cross-Platform C# App Guide

## Why this exists
Every major tool can be run through PowerShell or through compiled C# entrypoint apps for easy collaboration across Windows and Linux.

## Apps
- `RedEclipse.DevKit.Cli`
  - Save/load reusable project files (`*.devkit.json`)
  - Run mapped tools with consistent parameters
- `RedEclipse.DevKit.MenuDesigner`
  - Build in-game menus with buttons and commands
  - Save as cfg file and optionally install directly into game scripts directory

## Build
`bash scripts/build-apps.sh`

## CLI commands
- `list-tools`
- `new <tool> <name>`
- `save <project.json> key=value ...`
- `run <project.json>`

## Example
`dotnet run --project src/csharp/RedEclipse.DevKit.Cli -- new variable-preset-manager lowgrav_pack`
`dotnet run --project src/csharp/RedEclipse.DevKit.Cli -- save projects/lowgrav_pack.devkit.json PresetName=lowgrav_training`
`dotnet run --project src/csharp/RedEclipse.DevKit.Cli -- run projects/lowgrav_pack.devkit.json`

## Menu testing
1. Run menu designer and generate `scripts/menus/<name>.cfg`.
2. In-game execute: `/exec scripts/<name>.cfg`
3. Open menu: `/<name>_open`
