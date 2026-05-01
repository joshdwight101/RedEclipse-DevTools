param([string]$InstallRoot = 'C:\RedEclipseDevKit')
$ErrorActionPreference = 'Stop'
Write-Host "Installing Red Eclipse DevKit to $InstallRoot"
New-Item -Path $InstallRoot -ItemType Directory -Force | Out-Null

$required = 'powershell','dotnet','node','docker'
foreach ($cmd in $required) {
  if (-not (Get-Command $cmd -ErrorAction SilentlyContinue)) {
    Write-Warning "$cmd not found. Install it before full operation."
  }
}

Write-Host 'Build Windows app suite:'
Write-Host 'dotnet build src/csharp/RedEclipse.DevKit.Windows.Launcher/RedEclipse.DevKit.Windows.Launcher.csproj'
Write-Host 'dotnet build src/csharp/RedEclipse.DevKit.Windows.MapDesigner/RedEclipse.DevKit.Windows.MapDesigner.csproj'
Write-Host 'dotnet build src/csharp/RedEclipse.DevKit.Windows.MutatorBuilder/RedEclipse.DevKit.Windows.MutatorBuilder.csproj'
Write-Host 'dotnet build src/csharp/RedEclipse.DevKit.Windows.AssetPipeline/RedEclipse.DevKit.Windows.AssetPipeline.csproj'
Write-Host 'dotnet build src/csharp/RedEclipse.DevKit.Windows.ServerOrchestrator/RedEclipse.DevKit.Windows.ServerOrchestrator.csproj'
Write-Host 'Installation bootstrap complete.'
