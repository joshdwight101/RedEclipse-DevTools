# Red Eclipse Advanced DevTools Architecture

This repository externalizes map editing automation, server operations, and agent skills for Red Eclipse.

## Components
- `src/launcher`: PowerShell kiosk and local HttpListener launcher.
- `src/frontend`: browser dashboard for command dispatch.
- `src/ipc_bridge`: Node.js WebSocket-to-engine protocol bridge plus Windows named pipe adapter.
- `docker`: containerized dedicated server deployment.
- `.agents/skills`: OpenClaw skill bundles.
- `.codex`: durable agent rules and execution planning.

## Runtime
1. Start IPC bridge (`npm start` in `src/ipc_bridge`).
2. Launch frontend host with PowerShell launcher.
3. Run Docker compose for dedicated infrastructure.
4. Use skills for optimization, diagnostics, and mutator generation.
