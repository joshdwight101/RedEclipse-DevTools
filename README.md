# Red Eclipse Ultimate Developer Toolkit

One-command installers for Windows and Linux that set up dependencies, install the toolkit, and provide a launcher GUI to run the entire suite.

## Windows (fully automated)
Run in elevated PowerShell from repo root:

`powershell -ExecutionPolicy RemoteSigned -File installers/windows/install-devkit.ps1`

What it does:
- Installs missing dependencies with `winget` (Git, Node LTS, .NET 8 SDK, Docker Desktop, PowerShell 7).
- Copies toolkit files to `%ProgramFiles%\RedEclipseDevKit`.
- Installs Node dependencies for IPC bridge.
- Publishes the Windows launcher app.
- Creates desktop + Start Menu shortcuts named **Red Eclipse DevKit**.

## Linux Ubuntu (fully automated)
Run with sudo from repo root:

`sudo bash installers/ubuntu/install-devkit.sh`

What it does:
- Installs required packages (`zenity`, `node`, `docker`, `pwsh`, `.NET 8` when available).
- Copies toolkit to `/opt/redeclipse-devkit`.
- Installs Node dependencies for IPC bridge.
- Creates launcher command `redeclipse-devkit`.
- Creates application menu entry **Red Eclipse DevKit**.

## Launcher GUI capabilities
Both OS launchers provide options to:
- Start entire suite
- Launch Map Designer
- Launch Mutator Builder
- Launch Asset Pipeline
- Launch Server Orchestrator
- Start IPC bridge
- Open web dashboard
- Start Docker server runtime

## Project Structure
- `src/csharp/RedEclipse.DevKit.Windows.*`: Windows native app launcher + app shells.
- `src/linux/gui`: Linux launcher GUI.
- `src/linux/scripts`: Linux automation scripts.
- `src/powershell`: Shared business logic modules and tool scripts.
- `src/ipc_bridge`: Node IPC bridge.
- `docker`: Dedicated server stack.
- `installers`: Automated setup entrypoints.
