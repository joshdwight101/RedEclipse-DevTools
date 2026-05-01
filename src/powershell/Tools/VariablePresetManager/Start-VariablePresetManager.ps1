Import-Module "$PSScriptRoot/../../Modules/DevKit.Common.psm1" -Force
Import-Module "$PSScriptRoot/../../Modules/DevKit.VariablePresets.psm1" -Force
param(
  [string]$PresetName='lowgrav_training',
  [string]$OutputDir="$PSScriptRoot/../../../../scripts/presets"
)

$variables = @{
  sv_gravity = 60
  sv_impulsestyle = 1
  sv_jumpspeed = 140
  sv_weapondamage_scale = 1.25
  sv_regendelay = 250
  sv_aircontrol = 1
  sv_fog = 20
  sv_skybox = 'skyboxes/training'
}
$path = Save-VariablePreset -PresetName $PresetName -Variables $variables -OutputDir $OutputDir
Write-DevKitLog "Preset created: $path"
Write-DevKitLog "In-game usage: /exec presets/$PresetName.cfg"
