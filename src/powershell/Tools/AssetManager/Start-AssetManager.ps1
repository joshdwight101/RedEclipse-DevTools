Import-Module "$PSScriptRoot/../../Modules/DevKit.Common.psm1" -Force
param(
  [ValidateSet('scan','import','deploy')][string]$Action='scan',
  [string]$SourcePath,
  [string]$AssetType='models'
)
$assetRoot = "$PSScriptRoot/../../../../assets"
$target = Join-Path $assetRoot $AssetType
New-Item -ItemType Directory -Path $target -Force | Out-Null

switch ($Action) {
  'scan' {
    Write-DevKitLog "Asset inventory in $assetRoot"
    Get-ChildItem -Path $assetRoot -Recurse -File | Select-Object FullName
  }
  'import' {
    if (-not $SourcePath) { throw 'SourcePath required for import' }
    Copy-Item -Path $SourcePath -Destination $target -Recurse -Force
    Write-DevKitLog "Imported assets to $target"
  }
  'deploy' {
    $out = "$PSScriptRoot/../../../../scripts/assets/assets_manifest.cfg"
    New-Item -ItemType Directory -Path (Split-Path $out -Parent) -Force | Out-Null
    Get-ChildItem -Path $assetRoot -Recurse -File | ForEach-Object { "// asset $($_.FullName)" } | Set-Content $out
    Write-DevKitLog "Deployed asset manifest: $out"
  }
}
