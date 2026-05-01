# Ubuntu Setup Guide

1. Run `bash installers/ubuntu/install-devkit.sh`.
2. Start toolkit core: `pwsh -File src/powershell/Core/Start-DevKit.ps1`.
3. Start IPC bridge in `src/ipc_bridge`.
4. Launch container server stack from `docker/docker-compose.yml`.
