param([string]$InstallRoot = 'C:\RedEclipseDevKit')
$ErrorActionPreference = 'Stop'
Write-Host "Installing Red Eclipse DevKit to $InstallRoot"
New-Item -Path $InstallRoot -ItemType Directory -Force | Out-Null
Write-Host 'Validating prerequisites: pwsh, dotnet, node, docker'
foreach ($cmd in 'pwsh','dotnet','node','docker') {
  if (-not (Get-Command $cmd -ErrorAction SilentlyContinue)) {
    Write-Warning "$cmd not found. Install it before full operation."
  }
}
Write-Host 'Installation bootstrap complete.'
