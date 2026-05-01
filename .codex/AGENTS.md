# Codex Durable Rules for Red Eclipse DevTools

## Mission
Build and maintain an externalized Red Eclipse development and server operations platform with strict modular boundaries, secure defaults, and reproducible deployment.

## Architectural Guardrails
1. Keep launcher, IPC bridge, frontend, and server automation as separate bounded contexts.
2. Never hardcode secrets or credentials; use environment variables.
3. Prefer append-only logging to `/dev/shm/redeclipse` for high-frequency telemetry.
4. Preserve compatibility with Red Eclipse command semantics and CubeScript payloads.
5. Validate external payloads before command forwarding.

## Coding Standards
- Use Node.js LTS features only; keep dependencies minimal.
- Make PowerShell launcher scripts executable with `-ExecutionPolicy RemoteSigned`.
- Keep scripts composable and testable; avoid oversized files.

## Operational Standards
- Containers must run as non-root where possible.
- Default networking should be internal-only and proxy-oriented.
- Write documentation for every runtime component in `docs/`.

## Agent Workflow
- Keep a living execution plan in `.codex/pilot_execplan.md`.
- Apply incremental changes and verify syntax after each major step.
- Avoid destructive actions without explicit rollback strategy.
