# Red Eclipse Ultimate Developer Toolkit

Complete cross-platform toolkit for Red Eclipse with Windows C# app suite, Linux GUI scripts, PowerShell automation core, IPC bridge, and Docker server orchestration.

## What is included
- Windows native C# apps (WinForms):
  - Toolkit Launcher
  - Map Designer
  - Mutator Builder
  - Asset Pipeline
  - Server Orchestrator
- Linux GUI + automation:
  - Zenity launcher
  - Healthcheck/start-all scripts
  - systemd service template
- Shared automation/runtime:
  - PowerShell modules + mini-app scripts
  - Node IPC bridge (WebSocket + UNIX socket + UDP/TCP forward)
  - Dockerized Red Eclipse dedicated server runtime

## Build and run (Windows)
1. `powershell -ExecutionPolicy RemoteSigned -File installers/windows/install-devkit.ps1`
2. `dotnet build src/csharp/RedEclipse.DevKit.Windows.Launcher/RedEclipse.DevKit.Windows.Launcher.csproj`
3. `dotnet run --project src/csharp/RedEclipse.DevKit.Windows.Launcher`

## Build and run (Ubuntu)
1. `bash installers/ubuntu/install-devkit.sh`
2. `src/linux/scripts/devkit-healthcheck.sh`
3. `src/linux/gui/devkit-launcher.sh`

## Core services
- IPC Bridge: `cd src/ipc_bridge && npm install && npm start`
- Docker server: `docker compose -f docker/docker-compose.yml up --build`
- PowerShell core: `pwsh -File src/powershell/Core/Start-DevKit.ps1`

## Project structure
- `src/csharp/RedEclipse.DevKit.Windows.*` Windows desktop application suite.
- `src/linux/gui` Linux no-code GUI launcher scripts.
- `src/linux/scripts` Linux orchestration and health scripts.
- `src/powershell` shared business logic and code generation.
- `src/ipc_bridge` engine communication bridge.
- `docker` dedicated server runtime.
- `installers` bootstrap installers per OS.

## License
See `LICENSE` (Red Eclipse-style zlib + CC BY-SA summary).
