# Server Management Suite (Windows/Linux/Unraid)

## Automated deployment scripts
- Linux generic: `scripts/server/deploy/linux/deploy-redeclipse-server.sh`
- Unraid docker flow: `scripts/server/deploy/linux/deploy-unraid.sh`
- Windows PowerShell: `scripts/server/deploy/windows/deploy-redeclipse-server.ps1`

Each script prompts for:
- server name
- private/open mode (join password)
- max players/admin credentials

Scripts pull latest upstream repository and generate `.env` for docker deployment.

## Windows GUI Server Manager
Project: `src/csharp/RedEclipse.DevKit.ServerManager`

Features:
- multi-server list
- start/stop actions
- log refresh / connected-player parsing
- apply variable cfg directly from preset manager outputs
- mini console send command box
- hotkeys:
  - Ctrl+N new server
  - Ctrl+R start
  - Ctrl+S stop
  - Ctrl+L refresh logs
  - Ctrl+V apply cfg

## Linux Server Manager (PowerShell)
`pwsh -File src/powershell/Tools/ServerManager/Start-ServerManager.ps1`

Actions:
- create sandbox
- start
- stop
- logs
- apply-preset
