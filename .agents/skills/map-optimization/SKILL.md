---
name: map-optimization
description: Optimize Red Eclipse map geometry and lighting by invoking remip and calclight.
version: 1.0.0
---
# Workflow
1. Accept map file path ending in `.mpz`.
2. Parse metadata and identify active map name.
3. Connect to IPC bridge UNIX socket or named pipe.
4. Send `/remip` then `/calclight`.
5. Log execution duration and success state to `/dev/shm/redeclipse/map-opt.log`.
