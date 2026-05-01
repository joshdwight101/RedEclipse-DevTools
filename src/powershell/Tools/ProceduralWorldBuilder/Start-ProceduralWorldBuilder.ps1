Import-Module "$PSScriptRoot/../../Modules/DevKit.Common.psm1" -Force
Import-Module "$PSScriptRoot/../../Modules/Procedural/DevKit.Procedural.psm1" -Force

param(
  [int]$Width=64,
  [int]$Height=64,
  [double]$Scale=0.12,
  [int]$Seed=1337,
  [int]$EntityCount=64,
  [string]$Texture='textures/world/default',
  [string]$Skybox='skyboxes/default'
)

$heightMap = New-ProcHeightMap -Width $Width -Height $Height -Scale $Scale -Seed $Seed
$entities = New-ProcEntityLayout -Count $EntityCount -MapSize ($Width*16) -Seed $Seed

$presetPath = "$PSScriptRoot/../../../../scripts/procgen/world_$Seed.cfg"
$entitiesPath = "$PSScriptRoot/../../../../scripts/procgen/entities_$Seed.json"

Export-ProcWorldPreset -HeightMap $heightMap -OutputPath $presetPath -Texture $Texture -Skybox $Skybox | Out-Null
$entities | ConvertTo-Json -Depth 4 | Set-Content -Path $entitiesPath -Encoding UTF8

Write-DevKitLog "Procedural world preset: $presetPath"
Write-DevKitLog "Procedural entities json: $entitiesPath"
Write-DevKitLog "In-game usage: /exec procgen/world_$Seed.cfg"
