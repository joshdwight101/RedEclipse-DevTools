function New-VariablePresetCfg {
  param(
    [string]$PresetName,
    [hashtable]$Variables
  )
  if (-not $PresetName) { throw 'PresetName required' }
  if (-not $Variables) { throw 'Variables required' }

  $lines = @("// Generated preset: $PresetName")
  foreach ($k in $Variables.Keys | Sort-Object) {
    $v = $Variables[$k]
    if ($v -is [string]) { $lines += "$k \"$v\"" }
    else { $lines += "$k $v" }
  }
  return ($lines -join [Environment]::NewLine)
}

function Save-VariablePreset {
  param([string]$PresetName,[hashtable]$Variables,[string]$OutputDir)
  $cfg = New-VariablePresetCfg -PresetName $PresetName -Variables $Variables
  New-Item -ItemType Directory -Path $OutputDir -Force | Out-Null
  $path = Join-Path $OutputDir "$PresetName.cfg"
  Set-Content -Path $path -Value $cfg -Encoding UTF8
  return $path
}

Export-ModuleMember -Function New-VariablePresetCfg,Save-VariablePreset
