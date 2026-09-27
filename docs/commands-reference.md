# Usage reference

Use natural-language prompts with an explicit skill name, for example `Use $geo to audit https://example.com`. The main skill supports **audit** (find and score), **fix** (edit authorized project files), and **verify** (recheck actual output). `Use $geo quick to review https://example.com` requests a smaller sample; state the sample size and avoid a full-site score from insufficient evidence.

Focused prompts: `Use $geo-citability to review <url>`, `Use $geo-crawlers to inspect <url>`, `Use $geo-schema to inspect <url>`, `Use $geo-technical to audit <url>`, or `Use $geo-report-pdf to turn the completed report into a PDF`. Other skills are listed in [skills and checklists](skills-and-agents.md). The old `/geo` syntax belonged to Claude Code and is not supported as a shell or Codex command.
