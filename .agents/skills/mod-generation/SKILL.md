---
name: mod-generation
description: Generate CubeScript mutators from natural-language gameplay goals.
version: 1.0.0
---
# Workflow
1. Parse intent (mode, physics, spawn loadout, scoring rules).
2. Produce CubeScript for Deathmatch, CTF, or Bomber Ball.
3. Validate syntax against project conventions.
4. Save to `scripts/mutators/<name>.cfg` and emit deployment instructions.
