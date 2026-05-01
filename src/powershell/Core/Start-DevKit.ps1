Import-Module "$PSScriptRoot/../Modules/DevKit.Common.psm1" -Force
$ctx = New-DevKitContext
Write-DevKitLog "Starting Red Eclipse DevKit on $($ctx.Platform) at $($ctx.Workspace)"
Write-DevKitLog "Available mini apps: MapDesigner, MutatorBuilder, AssetPipeline, ServerOrchestrator"
