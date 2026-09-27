#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/CyberZenithX/geo-seo-codex.git"
CODEX_SKILLS_DIR="${CODEX_HOME:-$HOME/.codex}/skills"
GEO_DIR="$CODEX_SKILLS_DIR/geo"
TEMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TEMP_DIR"' EXIT

if [[ -f "$(dirname "${BASH_SOURCE[0]}")/geo/SKILL.md" ]]; then
    SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
else
    command -v git >/dev/null || { echo 'Git is required.' >&2; exit 1; }
    git clone --depth 1 "$REPO_URL" "$TEMP_DIR/repo"
    SOURCE_DIR="$TEMP_DIR/repo"
fi

PYTHON_CMD=""
for candidate in python3 python; do
    if command -v "$candidate" >/dev/null && "$candidate" -c 'import sys; assert sys.version_info >= (3, 8)' 2>/dev/null; then
        PYTHON_CMD="$candidate"
        break
    fi
done
[[ -n "$PYTHON_CMD" ]] || { echo 'Python 3.8+ is required.' >&2; exit 1; }

mkdir -p "$CODEX_SKILLS_DIR" "$GEO_DIR"
cp -R "$SOURCE_DIR/geo/." "$GEO_DIR/"
for source_skill in "$SOURCE_DIR"/skills/geo-*/; do
    [[ -d "$source_skill" ]] || continue
    target_skill="$CODEX_SKILLS_DIR/$(basename "$source_skill")"
    mkdir -p "$target_skill"
    cp -R "$source_skill/." "$target_skill/"
done
for component in scripts schema templates agents; do
    if [[ -d "$SOURCE_DIR/$component" ]]; then
        mkdir -p "$GEO_DIR/$component"
        cp -R "$SOURCE_DIR/$component/." "$GEO_DIR/$component/"
    fi
done
cp "$SOURCE_DIR/requirements.txt" "$GEO_DIR/requirements.txt"

"$PYTHON_CMD" -m venv "$GEO_DIR/.venv"
if [[ -x "$GEO_DIR/.venv/Scripts/python.exe" ]]; then
    VENV_PY="$GEO_DIR/.venv/Scripts/python.exe"
else
    VENV_PY="$GEO_DIR/.venv/bin/python"
fi
"$VENV_PY" -m pip install -r "$GEO_DIR/requirements.txt"

[[ -f "$GEO_DIR/SKILL.md" && -f "$CODEX_SKILLS_DIR/geo-audit/SKILL.md" && -f "$GEO_DIR/agents/geo-technical.md" ]] || {
    echo 'Installation failed verification.' >&2
    exit 1
}
echo "Installed GEO and $(find "$SOURCE_DIR/skills" -mindepth 1 -maxdepth 1 -type d | wc -l | tr -d ' ') specialized skills to $CODEX_SKILLS_DIR"
echo 'Open a new Codex conversation and try: Use $geo to audit https://example.com'
