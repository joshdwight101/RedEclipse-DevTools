Import-Module "$PSScriptRoot/../../Modules/DevKit.Common.psm1" -Force
param([string]$MapFile)
if (-not $MapFile) { throw 'MapFile is required' }
Write-DevKitLog "Optimizing map: $MapFile"
Write-DevKitLog "Would send: /remip and /calclight via IPC bridge"
