# Tool Catalog (Command + Purpose + Example)

## PowerShell Tools
- ContentPipeline
  - Command: `pwsh -File src/powershell/Tools/ContentPipeline/Start-ContentPipeline.ps1`
  - Example: `... -Action import-model -SourcePath ./exports -Name hero_pack`
- AssetManager
  - Command: `pwsh -File src/powershell/Tools/AssetManager/Start-AssetManager.ps1`
- ModelManager
  - Command: `pwsh -File src/powershell/Tools/ModelManager/Start-ModelManager.ps1`
- VariablePresetManager
  - Command: `pwsh -File src/powershell/Tools/VariablePresetManager/Start-VariablePresetManager.ps1`
- ProceduralWorldBuilder
  - Command: `pwsh -File src/powershell/Tools/ProceduralWorldBuilder/Start-ProceduralWorldBuilder.ps1`
- MutatorBuilder
  - Command: `pwsh -File src/powershell/Tools/MutatorBuilder/Start-MutatorBuilder.ps1`
- MapDesigner
  - Command: `pwsh -File src/powershell/Tools/MapDesigner/Start-MapDesigner.ps1`
- ServerOrchestrator
  - Command: `pwsh -File src/powershell/Tools/ServerOrchestrator/Start-ServerOrchestrator.ps1`
- ServerManager
  - Command: `pwsh -File src/powershell/Tools/ServerManager/Start-ServerManager.ps1`

## C# Apps
- RedEclipse.DevKit.Cli
  - `dotnet run --project src/csharp/RedEclipse.DevKit.Cli -- list-tools`
- RedEclipse.DevKit.MenuDesigner
  - `dotnet run --project src/csharp/RedEclipse.DevKit.MenuDesigner`
- RedEclipse.DevKit.ContentStudio
  - `dotnet run --project src/csharp/RedEclipse.DevKit.ContentStudio`
- RedEclipse.DevKit.ServerManager
  - `dotnet run --project src/csharp/RedEclipse.DevKit.ServerManager`

## Server Deployment Scripts
- Linux generic: `scripts/server/deploy/linux/deploy-redeclipse-server.sh`
- Unraid: `scripts/server/deploy/linux/deploy-unraid.sh`
- Windows: `scripts/server/deploy/windows/deploy-redeclipse-server.ps1`
