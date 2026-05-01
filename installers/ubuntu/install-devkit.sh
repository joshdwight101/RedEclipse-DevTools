#!/usr/bin/env bash
set -euo pipefail

INSTALL_ROOT=${INSTALL_ROOT:-/opt/redeclipse-devkit}
SOURCE_ROOT=${SOURCE_ROOT:-$(cd "$(dirname "$0")/../.." && pwd)}
USER_HOME=${SUDO_USER:+$(getent passwd "$SUDO_USER" | cut -d: -f6)}
USER_HOME=${USER_HOME:-$HOME}

require_root() {
  if [[ $EUID -ne 0 ]]; then
    echo "Run with sudo: sudo bash installers/ubuntu/install-devkit.sh" >&2
    exit 1
  fi
}

require_root

echo "[INFO] Installing dependencies"
apt-get update
apt-get install -y curl ca-certificates gnupg zenity nodejs npm docker.io docker-compose-plugin

if ! command -v pwsh >/dev/null 2>&1; then
  echo "[INFO] Installing PowerShell"
  wget -q https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O /tmp/packages-microsoft-prod.deb
  dpkg -i /tmp/packages-microsoft-prod.deb
  apt-get update
  apt-get install -y powershell
fi

if ! command -v dotnet >/dev/null 2>&1; then
  echo "[INFO] Installing .NET 8 SDK"
  apt-get install -y dotnet-sdk-8.0 || true
fi

echo "[INFO] Syncing files to $INSTALL_ROOT"
mkdir -p "$INSTALL_ROOT"
rsync -a --delete --exclude '.git' --exclude 'node_modules' --exclude 'bin' --exclude 'obj' "$SOURCE_ROOT/" "$INSTALL_ROOT/"

pushd "$INSTALL_ROOT/src/ipc_bridge" >/dev/null
npm install
popd >/dev/null

echo "[INFO] Creating launcher wrapper"
cat > /usr/local/bin/redeclipse-devkit <<LAUNCH
#!/usr/bin/env bash
cd "$INSTALL_ROOT"
exec "$INSTALL_ROOT/src/linux/gui/devkit-launcher.sh"
LAUNCH
chmod +x /usr/local/bin/redeclipse-devkit

mkdir -p "$USER_HOME/.local/share/applications"
cat > "$USER_HOME/.local/share/applications/redeclipse-devkit.desktop" <<DESKTOP
[Desktop Entry]
Type=Application
Name=Red Eclipse DevKit
Exec=/usr/local/bin/redeclipse-devkit
Terminal=false
Categories=Development;Game;
DESKTOP
chown -R ${SUDO_USER:-$USER}:${SUDO_USER:-$USER} "$USER_HOME/.local/share/applications/redeclipse-devkit.desktop"

echo "[INFO] Done. Launch via app menu: Red Eclipse DevKit or run: redeclipse-devkit"
