---
name: server-diagnostic
description: Monitor volatile logs and enforce defensive server configuration updates.
version: 1.0.0
---
# Workflow
1. Watch `/dev/shm/redeclipse/*.log` for disconnect floods, privilege abuse, and cheat indicators.
2. Correlate suspicious actors by IP and frequency threshold.
3. Patch `scripts/servinit.cfg.template` policy section with mitigation directives.
4. Trigger graceful restart through orchestrator command.
