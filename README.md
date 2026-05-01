# Red Eclipse Ultimate Developer Toolkit

Cross-platform toolkit with both PowerShell-first tools and compiled C# app binaries for Windows and Linux collaboration.

## Install
- Windows: `powershell -ExecutionPolicy RemoteSigned -File installers/windows/install-devkit.ps1`
- Ubuntu: `sudo bash installers/ubuntu/install-devkit.sh`

## Compiled C# apps (Windows + Linux)
Build/publish all cross-platform EXE-style binaries:
`bash scripts/build-apps.sh`

Produced apps:
- `RedEclipse.DevKit.Cli` (project save/load/run orchestrator)
- `RedEclipse.DevKit.MenuDesigner` (in-game menu builder)

## Project save/load workflow
1. Create project:
`dotnet run --project src/csharp/RedEclipse.DevKit.Cli -- new procedural-world-builder my_world`
2. Save parameters:
`dotnet run --project src/csharp/RedEclipse.DevKit.Cli -- save projects/my_world.devkit.json Seed=4242 Width=96 Height=96 EntityCount=140`
3. Run tool:
`dotnet run --project src/csharp/RedEclipse.DevKit.Cli -- run projects/my_world.devkit.json`

## Menu Designer workflow
Run:
`dotnet run --project src/csharp/RedEclipse.DevKit.MenuDesigner`

It lets you create menu buttons/commands and outputs menu cfg files into `scripts/menus/` with optional direct installation into game files.

## PowerShell tool suite
Asset Manager, Model Manager, Variable Preset Manager, Procedural World Builder, Mutator Builder, Map Designer, Server Orchestrator.

## Documentation
- User manual: `docs/manuals/user-manual.md`
- Procedural guide: `docs/guides/procgen/procedural-world-builder.md`
- App guide: `docs/guides/apps/cross-platform-apps.md`
