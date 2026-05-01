function New-ProcHeightMap {
  param([int]$Width=64,[int]$Height=64,[double]$Scale=0.12,[int]$Seed=1337)
  $rand = [System.Random]::new($Seed)
  $rows = @()
  for ($y=0; $y -lt $Height; $y++) {
    $row = @()
    for ($x=0; $x -lt $Width; $x++) {
      $n = [Math]::Sin($x*$Scale) + [Math]::Cos($y*$Scale) + (($rand.NextDouble()-0.5)*0.8)
      $h = [Math]::Round((($n+2.0)/4.0)*255)
      if ($h -lt 0) { $h = 0 }
      if ($h -gt 255) { $h = 255 }
      $row += $h
    }
    $rows += ,$row
  }
  return $rows
}

function Export-ProcWorldPreset {
  param(
    [array]$HeightMap,
    [string]$OutputPath,
    [string]$Texture='textures/world/default',
    [string]$Skybox='skyboxes/default'
  )
  $w = $HeightMap[0].Count
  $h = $HeightMap.Count
  $lines = @(
    "// Procedural world preset",
    "alias proc_world_width $w",
    "alias proc_world_height $h",
    "texture 0 \"$Texture\"",
    "loadsky \"$Skybox\""
  )
  for ($y=0; $y -lt $h; $y++) {
    $encoded = ($HeightMap[$y] -join ',')
    $lines += "alias proc_row_$y \"$encoded\""
  }
  New-Item -ItemType Directory -Path (Split-Path $OutputPath -Parent) -Force | Out-Null
  Set-Content -Path $OutputPath -Value ($lines -join [Environment]::NewLine) -Encoding UTF8
  return $OutputPath
}

function New-ProcEntityLayout {
  param([int]$Count=32,[int]$MapSize=1024,[int]$Seed=1337,[string[]]$EntityTypes=@('light','mapmodel','playerstart'))
  $rand = [System.Random]::new($Seed)
  $layout = @()
  for ($i=0; $i -lt $Count; $i++) {
    $layout += [pscustomobject]@{
      type = $EntityTypes[$rand.Next(0,$EntityTypes.Count)]
      x = $rand.Next(0,$MapSize)
      y = $rand.Next(0,$MapSize)
      z = $rand.Next(0,64)
    }
  }
  return $layout
}

Export-ModuleMember -Function New-ProcHeightMap,Export-ProcWorldPreset,New-ProcEntityLayout
