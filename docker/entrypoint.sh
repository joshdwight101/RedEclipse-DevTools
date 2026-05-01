#!/usr/bin/env bash
set -euo pipefail

: "${RE_SERVER_MODE:=3}"
: "${RE_MAX_CLIENTS:=16}"
: "${RE_DEFAULT_MAP:=forge}"
: "${RE_JOIN_PASS:=}"
: "${RE_ADMIN_PASS:=}"

mkdir -p /dev/shm/redeclipse /home/redeclipse/.redeclipse

ARGS=("-ss${RE_SERVER_MODE}" "-sc${RE_MAX_CLIENTS}" "-sl${RE_DEFAULT_MAP}")

if [[ -n "${RE_JOIN_PASS}" ]]; then
  ARGS+=("-sk${RE_JOIN_PASS}")
fi

if [[ -n "${RE_ADMIN_PASS}" ]]; then
  ARGS+=("-sP${RE_ADMIN_PASS}")
fi

exec /usr/lib/games/redeclipse/bin/redeclipse-server "${ARGS[@]}"
