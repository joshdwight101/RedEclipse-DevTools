Import-Module "$PSScriptRoot/../../Modules/DevKit.Common.psm1" -Force
param(
  [ValidateSet('create-template','import-model','deploy-model')][string]$Action='create-template',
  [string]$Name='new_model',
  [string]$SourcePath
)
$modelRoot = "$PSScriptRoot/../../../../assets/models"
New-Item -ItemType Directory -Path $modelRoot -Force | Out-Null

switch ($Action) {
  'create-template' {
    $dir = Join-Path $modelRoot $Name
    New-Item -ItemType Directory -Path $dir -Force | Out-Null
    @("// model config for $Name","md3load $Name.md3") | Set-Content (Join-Path $dir 'model.cfg')
    Write-DevKitLog "Created model template in $dir"
  }
  'import-model' {
    if (-not $SourcePath) { throw 'SourcePath required for import-model' }
    Copy-Item -Path $SourcePath -Destination $modelRoot -Recurse -Force
    Write-DevKitLog "Imported model content to $modelRoot"
  }
  'deploy-model' {
    $out = "$PSScriptRoot/../../../../scripts/assets/model_deploy.cfg"
    Get-ChildItem -Path $modelRoot -Directory | ForEach-Object { "mapmodel \"$($_.Name)\"" } | Set-Content $out
    Write-DevKitLog "Generated model deployment config: $out"
  }
}
