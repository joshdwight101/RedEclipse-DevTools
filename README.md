# Red Eclipse Ultimate Developer Toolkit

Advanced development + server administration suite for Red Eclipse with PowerShell tools, compiled C# apps, dockerized Linux/Unraid deployment scripts, and Windows GUI server manager.

## Install
- Windows: `powershell -ExecutionPolicy RemoteSigned -File installers/windows/install-devkit.ps1`
- Ubuntu: `sudo bash installers/ubuntu/install-devkit.sh`

## Feature-rich content workflow
### PowerShell Content Pipeline
- Tool: `src/powershell/Tools/ContentPipeline/Start-ContentPipeline.ps1`
- Supports:
  - texture import packs
  - model import + auto `model.cfg`
  - entity-pack import
  - map-kit publish (textures/models/entities cfg outputs)

### Windows Content Studio GUI (hotkeys)
- Project: `src/csharp/RedEclipse.DevKit.ContentStudio`
- Hotkeys:
  - Ctrl+1 textures
  - Ctrl+2 models
  - Ctrl+3 entities
  - Ctrl+4 publish

## Cross-platform compiled apps
Build:
`bash scripts/build-apps.sh`

Apps:
- `RedEclipse.DevKit.Cli` (project save/load/run)
- `RedEclipse.DevKit.MenuDesigner` (menu button builder)
- `RedEclipse.DevKit.ContentStudio` (Windows content GUI)
- `RedEclipse.DevKit.ServerManager` (Windows server manager GUI)

## Server automation and sandboxes
- Linux deploy: `scripts/server/deploy/linux/deploy-redeclipse-server.sh`
- Unraid deploy: `scripts/server/deploy/linux/deploy-unraid.sh`
- Windows deploy: `scripts/server/deploy/windows/deploy-redeclipse-server.ps1`
- Linux manager tool: `src/powershell/Tools/ServerManager/Start-ServerManager.ps1`
- Guide: `docs/guides/server-management/server-management-suite.md`

## Menu Designer
Run:
`dotnet run --project src/csharp/RedEclipse.DevKit.MenuDesigner`

Builds in-game menus with custom buttons and commands, exports to `scripts/menus`, and supports direct install into game scripts.

## Docs
- User manual: `docs/manuals/user-manual.md`
- Procedural world guide: `docs/guides/procgen/procedural-world-builder.md`
- App guide: `docs/guides/apps/cross-platform-apps.md`
- Server management guide: `docs/guides/server-management/server-management-suite.md`
