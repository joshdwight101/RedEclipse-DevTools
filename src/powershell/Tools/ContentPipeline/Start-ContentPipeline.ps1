Import-Module "$PSScriptRoot/../../Modules/DevKit.Common.psm1" -Force
param(
  [ValidateSet('scan','import-texture','import-model','import-entity-pack','publish-map-kit')][string]$Action='scan',
  [string]$SourcePath,
  [string]$Name='bundle',
  [string]$MapKitName='devkit_mapkit'
)

$root = "$PSScriptRoot/../../../../assets"
$textures = Join-Path $root 'textures'
$models = Join-Path $root 'models'
$entities = Join-Path $root 'entities'
foreach($d in @($textures,$models,$entities)){ New-Item -ItemType Directory -Path $d -Force | Out-Null }

switch($Action){
  'scan' {
    Write-DevKitLog "Scanning content repositories..."
    Get-ChildItem $root -Recurse -File | Select-Object FullName,Length
  }
  'import-texture' {
    if(-not $SourcePath){ throw 'SourcePath required' }
    $target=Join-Path $textures $Name
    New-Item -ItemType Directory -Path $target -Force | Out-Null
    Copy-Item $SourcePath $target -Recurse -Force
    Write-DevKitLog "Texture pack imported to $target"
  }
  'import-model' {
    if(-not $SourcePath){ throw 'SourcePath required' }
    $target=Join-Path $models $Name
    New-Item -ItemType Directory -Path $target -Force | Out-Null
    Copy-Item $SourcePath $target -Recurse -Force
    if(-not (Test-Path (Join-Path $target 'model.cfg'))){
      @("// auto model config","md3load model.md3") | Set-Content (Join-Path $target 'model.cfg')
    }
    Write-DevKitLog "Model bundle imported to $target"
  }
  'import-entity-pack' {
    if(-not $SourcePath){ throw 'SourcePath required' }
    $target=Join-Path $entities $Name
    New-Item -ItemType Directory -Path $target -Force | Out-Null
    Copy-Item $SourcePath $target -Recurse -Force
    Write-DevKitLog "Entity pack imported to $target"
  }
  'publish-map-kit' {
    $outDir = "$PSScriptRoot/../../../../scripts/assets/$MapKitName"
    New-Item -ItemType Directory -Path $outDir -Force | Out-Null
    Get-ChildItem $textures -Directory | ForEach-Object { "texture 0 \"textures/$($_.Name)\"" } | Set-Content (Join-Path $outDir 'textures.cfg')
    Get-ChildItem $models -Directory | ForEach-Object { "mapmodel \"$($_.Name)\"" } | Set-Content (Join-Path $outDir 'models.cfg')
    Get-ChildItem $entities -Directory | ForEach-Object { "// entity-pack $($_.Name)" } | Set-Content (Join-Path $outDir 'entities.cfg')
    Write-DevKitLog "Published map kit at $outDir"
  }
}
