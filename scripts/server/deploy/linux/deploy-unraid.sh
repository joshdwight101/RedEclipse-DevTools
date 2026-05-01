#!/usr/bin/env bash
set -euo pipefail

APPDATA=${APPDATA:-/mnt/user/appdata/redeclipse-devkit}
mkdir -p "$APPDATA" "$APPDATA/config" "$APPDATA/data"

read -rp "Unraid server name [Unraid Red Eclipse]: " NAME; NAME=${NAME:-Unraid Red Eclipse}
read -rp "Private? (y/N): " PRIVATE
read -rp "Admin pass [changeme]: " ADMIN; ADMIN=${ADMIN:-changeme}
read -rp "Join pass (blank for open): " JOIN

cat > "$APPDATA/.env" <<ENV
RE_SERVER_MODE=3
RE_MAX_CLIENTS=24
RE_DEFAULT_MAP=forge
RE_ADMIN_PASS=$ADMIN
RE_JOIN_PASS=$JOIN
SV_NAME=$NAME
ENV

cp scripts/server/templates/unraid/docker-compose.unraid.yml "$APPDATA/docker-compose.yml"
docker compose -f "$APPDATA/docker-compose.yml" --env-file "$APPDATA/.env" up -d
