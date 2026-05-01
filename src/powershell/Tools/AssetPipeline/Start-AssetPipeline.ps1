Import-Module "$PSScriptRoot/../../Modules/DevKit.Common.psm1" -Force
$assetsRoot = "$PSScriptRoot/../../../../assets"
Write-DevKitLog "Scanning assets at $assetsRoot"
Get-ChildItem -Path $assetsRoot -Directory | ForEach-Object { Write-DevKitLog "Detected asset group: $($_.Name)" }
