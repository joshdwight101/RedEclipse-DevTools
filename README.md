# Red Eclipse Ultimate Developer Toolkit

Version: **0.2.0** (see `VERSION`, `CHANGELOG.md`)

## Complete Documentation Index
- Full operations manual: `docs/manuals/full-operations-manual.md`
- User manual: `docs/manuals/user-manual.md`
- Tool catalog: `docs/reference/tool-catalog.md`
- Server management suite: `docs/guides/server-management/server-management-suite.md`
- Cross-platform app guide: `docs/guides/apps/cross-platform-apps.md`
- Procedural guide: `docs/guides/procgen/procedural-world-builder.md`

## Installation
- Windows: `powershell -ExecutionPolicy RemoteSigned -File installers/windows/install-devkit.ps1`
- Ubuntu: `sudo bash installers/ubuntu/install-devkit.sh`

## Build Compiled Apps
`bash scripts/build-apps.sh`

## Component READMEs and Changelogs
Every major component now includes:
- `README.md` (purpose + usage)
- `CHANGELOG.md` (component changes)

Examples:
- `src/powershell/Tools/ContentPipeline/README.md`
- `src/powershell/Tools/ContentPipeline/CHANGELOG.md`
- `src/csharp/RedEclipse.DevKit.ServerManager/README.md`
- `src/csharp/RedEclipse.DevKit.ServerManager/CHANGELOG.md`

## Suite Goals
- Advanced content import for textures, models, and entities.
- Procedural map bootstrap + visual workflows.
- Variable/mutator testing loops.
- Menu designer for in-game GUI modding.
- Linux/Unraid/Windows server deployment and management.
- Cross-tool integration for rapid sandbox iteration.
