---
name: geo
description: Audit, implement, and verify website GEO and SEO improvements, including AI search visibility, citations, crawler access, llms.txt, schema, content quality, and technical SEO. Use for a website audit, a page review, a codebase SEO fix, or a client GEO report.
---

# GEO for Codex

Use this skill for the full workflow. Specialized skills named `geo-*` are installed alongside it and can also be invoked directly. The user's request determines whether to audit, fix, or verify; do not modify a site when the user only requests an audit.

## Select a workflow

- **Audit:** Inspect the URL or local site, then use `geo-audit` for the six category scores and prioritized findings. For a short review, sample the homepage and important pages and state the sampling limit. Use `geo-citability`, `geo-crawlers`, `geo-llmstxt`, `geo-brand-mentions`, `geo-platform-optimizer`, `geo-schema`, `geo-technical`, and `geo-content` only as relevant. Report measured evidence separately from estimated readiness.
- **Fix:** Inspect the project's code, identify high priority findings, implement changes the user authorized, and check rendered HTML, metadata, robots, schema, internal links, and build. Preserve accurate claims and existing intent. Request input for business facts you cannot verify. Do not fabricate testimonials, citations, credentials, or review markup. Do not silently publish or change crawler permissions where business intent is unclear.
- **Verify:** Recheck the affected source files and rendered pages. Compare against the baseline findings and report what changed, what remains unverified, and any checks that could not run.
- **Specific request:** Read the matching specialized skill and follow its procedure. For proposals and prospect tracking, use `geo-proposal`, `geo-prospect`, and `geo-compare` only when requested. For reports use `geo-report` or `geo-report-pdf`.

## How to run an audit

1. Discover business type and high value pages from the homepage and sitemap. Respect robots.txt, cap crawling at 50 pages, rate limit requests, and use a 30 second fetch timeout.
2. Assess AI visibility, platform factors, technical foundations, content quality, and structured data. The five former Claude agent files in `agents/` are **reference checklists**, not registered Codex subagents. Read them as needed. Work sequentially unless the current environment explicitly permits delegation.
3. Apply the scoring rubric from `geo-audit/SKILL.md`: citability 25%, brand authority 20%, content 20%, technical 15%, schema 10%, platforms 10%. Mark unmeasured categories as unmeasured rather than inventing a score. Cite observed pages for actionable findings.
4. Produce a concise prioritized report or the requested client deliverable. Do not suggest that a score guarantees search ranking or AI citations. `llms.txt` is optional and its practical effect remains uncertain.

## Bundled tools

The installed skill root is `${CODEX_HOME:-$HOME/.codex}/skills/geo` in a shell. Use the Python interpreter at `.venv/bin/python` (macOS/Linux) or `.venv/Scripts/python.exe` (Windows) for bundled scripts. `scripts/run-python.sh` resolves either path from Git Bash or a Unix shell:

```bash
bash "${CODEX_HOME:-$HOME/.codex}/skills/geo/scripts/run-python.sh" \
  "${CODEX_HOME:-$HOME/.codex}/skills/geo/scripts/fetch_page.py" https://example.com page
```

Find JSON-LD samples under `schema/`, PDF styles under `templates/`, and the five category checklists under `agents/`. If a script cannot access the network, use available browsing tools and state the gap. If Codex runs in ChatGPT Work, a local CLI installation does not automatically register a Work skill; install the skill through the Work Skills interface for that environment.
