Import-Module "$PSScriptRoot/../../Modules/DevKit.Common.psm1" -Force
$composeFile = "$PSScriptRoot/../../../../docker/docker-compose.yml"
Write-DevKitLog "Server orchestrator ready. Compose file: $composeFile"
Write-DevKitLog "Run: docker compose -f $composeFile up --build"
