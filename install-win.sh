#!/usr/bin/env bash
set -euo pipefail

# Run from Git Bash on Windows. The shared installer detects Windows venv paths.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
exec bash "$SCRIPT_DIR/install.sh" "$@"
