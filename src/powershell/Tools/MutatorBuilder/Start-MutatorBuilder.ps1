Import-Module "$PSScriptRoot/../../Modules/DevKit.Common.psm1" -Force
Import-Module "$PSScriptRoot/../../Modules/DevKit.CodeGen.psm1" -Force

param([string]$Name='lowgrav_shotgun',[string]$Mode='bomber-ball',[int]$Gravity=60,[string]$Loadout='shotgun')
$script = New-MutatorScript -Name $Name -Mode $Mode -Gravity $Gravity -Loadout $Loadout
$targetDir = "$PSScriptRoot/../../../../scripts/mutators"
New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
$targetPath = Join-Path $targetDir "$Name.cfg"
Set-Content -Path $targetPath -Value $script -Encoding UTF8
Write-DevKitLog "Mutator generated at $targetPath"
