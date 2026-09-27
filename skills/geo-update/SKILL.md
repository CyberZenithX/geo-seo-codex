---
name: geo-update
description: Update a local Codex GEO toolkit installation from the CyberZenithX geo-seo-codex repository when the user explicitly requests an update.
---

# Update GEO for Codex

1. Confirm the user requested an update. Identify the installed directory with `${CODEX_HOME:-$HOME/.codex}/skills/geo`.
2. Fetch the latest `CyberZenithX/geo-seo-codex` revision and summarize changes to the skill instructions, scripts, requirements, and installer. Do not automatically pull from the original Claude repository: it has different installation conventions.
3. Run the checked-out repository's `install.sh` (or `install-win.sh` from Git Bash on Windows) to replace the toolkit files and update the dedicated venv. If the user maintains local edits, preserve them and explain conflicts before overwriting.
4. Verify `geo/SKILL.md`, specialized skills, bundled scripts, and checklists are installed. Report the revision and any validation failures.
