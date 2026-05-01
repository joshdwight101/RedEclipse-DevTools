Import-Module "$PSScriptRoot/../../Modules/DevKit.Common.psm1" -Force
param([ValidateSet('create','start','stop','logs','apply-preset')][string]$Action='create',[string]$Name='devserver1',[string]$PresetFile)
$root="$PSScriptRoot/../../../../servers/$Name"
switch($Action){
 'create'{New-Item -ItemType Directory -Path "$root/data","$root/config" -Force|Out-Null; Copy-Item "$PSScriptRoot/../../../../scripts/server/templates/linux/docker-compose.generic.yml" "$root/docker-compose.yml" -Force; Write-DevKitLog "Created server sandbox at $root"}
 'start'{docker compose -f "$root/docker-compose.yml" up -d --build}
 'stop'{docker compose -f "$root/docker-compose.yml" down}
 'logs'{docker logs --tail 200 redeclipse-server}
 'apply-preset'{if(-not $PresetFile){throw 'PresetFile required'}; Copy-Item $PresetFile "$root/config/active.cfg" -Force; Write-DevKitLog "Applied preset"}
}
