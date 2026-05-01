param([string]$RepoUrl='https://github.com/redeclipse/base.git',[string]$InstallRoot='C:\RedEclipseServer')
$serverName = Read-Host 'Server name (default: Red Eclipse Dev Server)'; if(-not $serverName){$serverName='Red Eclipse Dev Server'}
$private = Read-Host 'Private server? (y/N)'
$maxPlayers = Read-Host 'Max players (default:16)'; if(-not $maxPlayers){$maxPlayers='16'}
$adminPass = Read-Host 'Admin password (default:adminpass)'; if(-not $adminPass){$adminPass='adminpass'}
$joinPass = Read-Host 'Join password (blank=open)'

New-Item -ItemType Directory -Path $InstallRoot -Force | Out-Null
if(-not (Test-Path "$InstallRoot\base")){ git clone --recurse-submodules $RepoUrl "$InstallRoot\base" } else { git -C "$InstallRoot\base" pull }

@"
RE_SERVER_MODE=3
RE_MAX_CLIENTS=$maxPlayers
RE_DEFAULT_MAP=forge
RE_ADMIN_PASS=$adminPass
RE_JOIN_PASS=$joinPass
SV_NAME=$serverName
"@ | Set-Content "$InstallRoot\.env"

docker compose -f docker\docker-compose.yml --env-file "$InstallRoot\.env" up -d --build
Write-Host 'Server deployed. Use docker logs -f redeclipse-server'
