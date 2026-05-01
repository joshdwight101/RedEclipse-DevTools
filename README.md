# Red Eclipse Ultimate Developer Toolkit

A no-code/low-code ecosystem for Red Eclipse that helps players, creators, and server admins build maps, mutators, and deployments with guided mini-apps powered by PowerShell, C#, and cross-platform automation.

## Vision
- Turn creative players into developers with safe, visual, guided tooling.
- Generate validated backend code and configuration automatically.
- Reuse shared object-oriented libraries to eliminate repetitive logic.
- Run natively on **Windows** and **Ubuntu** with installers for both.

## Feature Areas
1. **Mini Apps (GUI-first)**
   - Map Designer Assistant
   - Mutator Builder Wizard
   - Asset Pipeline Manager
   - Server Orchestrator Console
2. **Cross-platform Runtime**
   - PowerShell 7 automation everywhere
   - C# GUI on Windows and Ubuntu via .NET
3. **Engine Integration**
   - IPC bridge for UNIX sockets, Windows named pipes, and WebSocket relay
   - CubeScript generation and command streaming
4. **Container Operations**
   - Dockerized dedicated server stack with `/dev/shm` acceleration

## Repository Layout
- `src/launcher` - kiosk + local host launcher scripts.
- `src/frontend` - lightweight web dashboard.
- `src/ipc_bridge` - command bridge services.
- `src/powershell` - mini-app orchestration and shared modules.
- `src/csharp` - object-oriented shared library + GUI shell.
- `installers/windows` - bootstrap and packaging scripts.
- `installers/ubuntu` - apt/bootstrap installer scripts.
- `docker` - container build and compose runtime.
- `.agents/skills` - OpenClaw skill bundles.
- `.codex` - durable agent memory and plans.

## Prerequisites
- Windows 10/11 or Ubuntu 22.04+
- PowerShell 7+
- .NET 8 SDK
- Node.js 20+
- Docker + Docker Compose plugin

## Quick Start (Windows)
1. Open PowerShell as Administrator.
2. Run installer:
   - `powershell -ExecutionPolicy RemoteSigned -File installers/windows/install-devkit.ps1`
3. Launch toolkit shell:
   - `powershell -ExecutionPolicy RemoteSigned -File src/powershell/Core/Start-DevKit.ps1`
4. Open GUI hub:
   - `dotnet run --project src/csharp/RedEclipse.DevKit.Gui`

## Quick Start (Ubuntu)
1. Run installer:
   - `bash installers/ubuntu/install-devkit.sh`
2. Launch automation core:
   - `pwsh -File src/powershell/Core/Start-DevKit.ps1`
3. Start GUI hub:
   - `dotnet run --project src/csharp/RedEclipse.DevKit.Gui`

## Running Core Services
### IPC bridge
```bash
cd src/ipc_bridge
npm install
npm start
```

### Docker server
```bash
docker compose -f docker/docker-compose.yml up --build
```

## Mini App Usage
### Map Designer Assistant
- Loads map metadata
- Sends `/remip` and `/calclight`
- Records optimization logs

### Mutator Builder Wizard
- Select mode: Deathmatch / CTF / Bomber Ball
- Configure gravity, loadout, scoring
- Exports CubeScript file into `scripts/mutators`

### Asset Pipeline Manager
- Watches `assets/models`, `assets/textures`, `assets/materials`
- Runs conversion pipeline presets
- Generates mapmodel config stubs

### Server Orchestrator Console
- Applies safe server presets
- Rotates maps and mutators
- Writes generated config to runtime paths

## Security and Safety
- Secrets are environment variables only.
- Commands are validated before forwarding.
- Runtime logs can be redirected to `/dev/shm/redeclipse`.

## Development Workflow
- Add shared PowerShell logic in `src/powershell/Modules`.
- Add OO reusable C# logic in `RedEclipse.DevKit.Core`.
- Keep GUI orchestration in `RedEclipse.DevKit.Gui` thin.
- Document all new tools under `docs/guides`.

## License
- Code: zlib-compatible (Red Eclipse style).
- Content/docs/assets: CC BY-SA aligned where noted.
- See `LICENSE`.
