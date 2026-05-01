param([string]$UserName = 'DeveloperKiosk')

$namespace = 'root\standardcimv2\embedded'
$class = Get-CimClass -Namespace $namespace -ClassName WESL_UserSetting -ErrorAction SilentlyContinue
if (-not $class) {
  Write-Error 'WESL_UserSetting unavailable. Run on Windows Enterprise/IoT with Shell Launcher enabled.'
  exit 1
}

$customShell = 'powershell.exe -ExecutionPolicy RemoteSigned -File C:\RedEclipse\src\launcher\launch-kiosk.ps1'
Write-Host "Configure kiosk shell for $UserName: $customShell"
