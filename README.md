# RedEclipse-DevTools

Agent-driven external development and server infrastructure for Red Eclipse.

## Quick start
- `cd src/ipc_bridge && npm install && npm start`
- `docker compose -f docker/docker-compose.yml up --build`
- On Windows kiosk hosts, run:
  - `powershell -ExecutionPolicy RemoteSigned -File src/launcher/launch-kiosk.ps1`
