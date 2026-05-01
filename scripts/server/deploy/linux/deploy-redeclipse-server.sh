#!/usr/bin/env bash
set -euo pipefail

REPO_URL=${REPO_URL:-https://github.com/redeclipse/base.git}
INSTALL_ROOT=${INSTALL_ROOT:-/opt/redeclipse-server}
read -rp "Server name [Red Eclipse Dev Server]: " SERVER_NAME; SERVER_NAME=${SERVER_NAME:-Red Eclipse Dev Server}
read -rp "Private server? (y/N): " PRIVATE
read -rp "Max players [16]: " MAX_PLAYERS; MAX_PLAYERS=${MAX_PLAYERS:-16}
read -rp "Admin password [adminpass]: " ADMIN_PASS; ADMIN_PASS=${ADMIN_PASS:-adminpass}
read -rp "Join password (empty=open): " JOIN_PASS

mkdir -p "$INSTALL_ROOT"
if [[ ! -d "$INSTALL_ROOT/base" ]]; then git clone --recurse-submodules "$REPO_URL" "$INSTALL_ROOT/base"; else git -C "$INSTALL_ROOT/base" pull; fi

cat > "$INSTALL_ROOT/.env" <<ENV
RE_SERVER_MODE=3
RE_MAX_CLIENTS=$MAX_PLAYERS
RE_DEFAULT_MAP=forge
RE_ADMIN_PASS=$ADMIN_PASS
RE_JOIN_PASS=$JOIN_PASS
SV_NAME=$SERVER_NAME
ENV

docker compose -f docker/docker-compose.yml --env-file "$INSTALL_ROOT/.env" up -d --build
echo "Deployed. Use docker ps / docker logs -f redeclipse-server"
