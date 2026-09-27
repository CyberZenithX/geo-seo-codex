#!/usr/bin/env bash
set -euo pipefail

SKILLS_DIR="${CODEX_HOME:-$HOME/.codex}/skills"
echo "Remove GEO skills from $SKILLS_DIR? [y/N]"
read -r answer
[[ "$answer" == "y" || "$answer" == "Y" ]] || exit 0
rm -rf -- "$SKILLS_DIR/geo"
for skill in "$SKILLS_DIR"/geo-*/; do
    [[ -d "$skill" ]] && rm -rf -- "$skill"
done
echo 'GEO skills removed. Prospect data was left intact.'
