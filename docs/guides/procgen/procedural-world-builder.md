# Procedural World Builder Guide (Linux + Ubuntu)

## Goal
Generate playable base worlds quickly, then import models/entities/textures and iterate visually.

## Command
`pwsh -File src/powershell/Tools/ProceduralWorldBuilder/Start-ProceduralWorldBuilder.ps1 -Seed 1337 -Width 64 -Height 64 -EntityCount 64`

## Output
- `scripts/procgen/world_<seed>.cfg` (terrain/texture/skybox preset)
- `scripts/procgen/entities_<seed>.json` (entity layout)

## Workflow
1. Run Procedural World Builder.
2. Run Asset Manager and Model Manager to import world content.
3. Use mod menu to load gameplay presets.
4. Iterate seed/size values until satisfied.

## Visual Interface
Open `src/frontend/procgen/index.html` in the local launcher host and use Preview + Copy Generation Command.
