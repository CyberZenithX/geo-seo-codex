# GEO-SEO for Codex

A Codex skill bundle for website GEO and SEO audits, implementation, and verification. Adapted from [zubair-trabzada/geo-seo-claude](https://github.com/zubair-trabzada/geo-seo-claude); see [LICENSE](LICENSE). The original scoring rubrics, templates, and Python utilities remain in this fork. Scores describe the observations in an audit, not guaranteed AI citations or rankings.

## Install

Requirements: Git, Python 3.8+ with `venv`, and a Codex environment that loads user skills. On Windows, use **Git Bash** and ensure Python is on `PATH`.

```bash
git clone https://github.com/CyberZenithX/geo-seo-codex.git
cd geo-seo-codex
bash install.sh                  # macOS/Linux
# or: bash install-win.sh       # Windows Git Bash
```

The installer copies `geo` and the specialized `geo-*` skills into `${CODEX_HOME:-$HOME/.codex}/skills`. It also copies the five original agent instructions under `geo/agents/` as reference checklists, plus scripts, schema, and templates. Python dependencies go into `geo/.venv`; the installer does not modify the system Python. If you set `CODEX_HOME`, set it in the same environment in which Codex runs. Open a new Codex conversation to discover newly installed skills.

This repository installs **local Codex skills**. ChatGPT Work has a separate Skills interface; placing files in the local Codex directory does not install them there.

## Use

In a new Codex conversation, try:

```text
Use $geo to audit https://example.com and prioritize findings.
Use $geo to fix safe high-priority GEO issues in this website project, then verify the build.
Use $geo to verify the metadata and schema changes in this branch.
Use $geo-citability to review https://example.com/blog/post.
```

You may also simply request an SEO or AI search visibility audit; the skill description helps Codex select it. `$geo audit` is a natural-language instruction to the skill, **not** a shell command or a Claude-style `/geo` command. Other focused skills include `$geo-crawlers`, `$geo-schema`, `$geo-technical`, `$geo-content`, `$geo-report`, `$geo-report-pdf`, `$geo-prospect`, `$geo-proposal`, and `$geo-compare`. See [geo/SKILL.md](geo/SKILL.md) and [docs/scoring-methodology.md](docs/scoring-methodology.md).

For PDF reports, install Pandoc and a Chromium-based browser separately and review `skills/geo-report-pdf/SKILL.md`; the skill does not bundle those applications. Live URL audits require network access. The bundled Python scripts may not be usable in a remote Codex environment that lacks your local installation.

## Update or remove

Pull this fork's latest revision and run the installer again to update. The `$geo-update` skill describes the same process. Run `bash uninstall.sh` to remove installed GEO skill directories; this leaves `~/.geo-prospects` data in place.

## Repository layout

- `geo/SKILL.md`: Codex entry point for audit, fix, and verify.
- `skills/geo-*/SKILL.md`: focused analysis and reporting workflows.
- `agents/`: category checklists copied under `geo/agents/`, without registering subagents.
- `scripts/`, `schema/`, `templates/`: reusable utilities and assets.
- `docs/scoring-methodology.md`: details of the scoring rubric.
