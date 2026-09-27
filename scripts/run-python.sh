#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GEO_DIR="$(dirname "$SCRIPT_DIR")"
if [[ -x "$GEO_DIR/.venv/Scripts/python.exe" ]]; then
    exec "$GEO_DIR/.venv/Scripts/python.exe" "$@"
fi
exec "$GEO_DIR/.venv/bin/python" "$@"
