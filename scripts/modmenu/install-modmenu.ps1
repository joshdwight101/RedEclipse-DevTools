param([string]$RedEclipseDataPath)
if (-not $RedEclipseDataPath) { throw 'Provide -RedEclipseDataPath path to your game data folder.' }
$targetScripts = Join-Path $RedEclipseDataPath 'scripts'
$targetPresets = Join-Path $targetScripts 'presets'
New-Item -ItemType Directory -Path $targetScripts -Force | Out-Null
New-Item -ItemType Directory -Path $targetPresets -Force | Out-Null
Copy-Item "$PSScriptRoot/devkit_modmenu.cfg" -Destination $targetScripts -Force
Copy-Item "$PSScriptRoot/../presets/*.cfg" -Destination $targetPresets -Force -ErrorAction SilentlyContinue
Write-Host "Installed mod menu and presets. In-game run: /exec scripts/devkit_modmenu.cfg"
