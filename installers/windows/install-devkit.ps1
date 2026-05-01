param(
  [string]$InstallRoot = "$env:ProgramFiles\RedEclipseDevKit",
  [string]$SourceRoot = (Resolve-Path "$PSScriptRoot/../..").Path
)
$ErrorActionPreference = 'Stop'

function Ensure-Command([string]$Name, [string]$WingetId) {
  if (Get-Command $Name -ErrorAction SilentlyContinue) { return }
  if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    throw "Missing required command '$Name' and winget is unavailable for auto-install."
  }
  Write-Host "Installing $Name via winget ($WingetId)..."
  winget install --id $WingetId --accept-package-agreements --accept-source-agreements -e
}

Write-Host "Installing Red Eclipse DevKit to $InstallRoot"
New-Item -ItemType Directory -Force -Path $InstallRoot | Out-Null

Ensure-Command -Name 'git' -WingetId 'Git.Git'
Ensure-Command -Name 'node' -WingetId 'OpenJS.NodeJS.LTS'
Ensure-Command -Name 'dotnet' -WingetId 'Microsoft.DotNet.SDK.8'
Ensure-Command -Name 'docker' -WingetId 'Docker.DockerDesktop'
Ensure-Command -Name 'pwsh' -WingetId 'Microsoft.PowerShell'

Write-Host 'Copying repository files...'
robocopy $SourceRoot $InstallRoot /MIR /XD .git node_modules bin obj | Out-Null

Write-Host 'Restoring Node dependencies...'
Push-Location "$InstallRoot\src\ipc_bridge"
npm install
Pop-Location

Write-Host 'Publishing Windows launcher...'
$launcherProj = "$InstallRoot\src\csharp\RedEclipse.DevKit.Windows.Launcher\RedEclipse.DevKit.Windows.Launcher.csproj"
dotnet publish $launcherProj -c Release -r win-x64 --self-contained false -o "$InstallRoot\dist\launcher"

Write-Host 'Creating desktop/start-menu shortcuts...'
$ws = New-Object -ComObject WScript.Shell
$desktop = [Environment]::GetFolderPath('Desktop')
$start = [Environment]::GetFolderPath('Programs')
foreach ($target in @($desktop, $start)) {
  $lnk = $ws.CreateShortcut((Join-Path $target 'Red Eclipse DevKit.lnk'))
  $lnk.TargetPath = "$InstallRoot\dist\launcher\RedEclipse.DevKit.Windows.Launcher.exe"
  $lnk.WorkingDirectory = "$InstallRoot"
  $lnk.IconLocation = "$env:SystemRoot\System32\shell32.dll,220"
  $lnk.Save()
}

Write-Host 'Installation complete. Launch "Red Eclipse DevKit" from desktop or Start Menu.'
