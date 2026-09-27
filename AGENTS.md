# Repository guidance

This repository is the source for a Codex skill bundle. The main skill is `geo/SKILL.md`; specialized skills live in `skills/geo-*/SKILL.md`. `install.sh` installs them into `${CODEX_HOME:-$HOME/.codex}/skills` with scripts and reference checklists inside the main skill.

When changing instructions, keep Codex metadata limited to `name` and `description`, avoid Claude-specific tool permissions and slash commands, and ensure commands work in macOS/Linux shells and Windows Git Bash. Do not treat reference checklists in `agents/` as registered subagents. Test installation with a temporary `CODEX_HOME` and run the relevant Python tests when scripts change.
