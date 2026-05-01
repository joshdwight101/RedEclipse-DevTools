function New-DevKitContext {
  param([string]$Workspace = (Resolve-Path "$PSScriptRoot/../../..").Path)
  [pscustomobject]@{
    Workspace = $Workspace
    Timestamp = (Get-Date).ToString('o')
    Platform = if ($IsWindows) { 'windows' } else { 'unix' }
  }
}

function Write-DevKitLog {
  param([string]$Message,[string]$Level='INFO')
  Write-Host "[$Level] $Message"
}

Export-ModuleMember -Function New-DevKitContext,Write-DevKitLog
