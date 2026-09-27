# Architecture

`geo/SKILL.md` routes audit, fix, and verify requests. Focused skills in `skills/` provide detailed rubrics. `agents/` contains the original five category checklists; the installer places them under the installed main skill as references. Codex uses them sequentially unless delegation is explicitly available and permitted. Utilities live in `scripts/`, JSON-LD examples in `schema/`, and PDF presentation assets in `templates/`.

Scores are weighted according to [scoring methodology](scoring-methodology.md). Python dependencies are isolated under the installed `geo/.venv`; `scripts/run-python.sh` chooses the Unix or Git Bash Windows interpreter. The optional prospect workflows store user data in `~/.geo-prospects/`.
