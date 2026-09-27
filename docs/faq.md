# FAQ

**How do I invoke it?** Ask Codex `Use $geo to audit <url>` or describe the GEO/SEO job normally. Open a new conversation after a local install.

**Where are files installed?** `${CODEX_HOME:-$HOME/.codex}/skills/geo` plus focused skills under the same `skills/` directory. `geo/.venv` stores Python dependencies.

**Do I need a separate API key?** The skill bundle has no dedicated API key. Codex access and network permissions depend on your environment.

**Are the five agents automatic?** No. They are reference checklists used by the main skill; there is no built-in concurrent dispatch.

**What does a GEO score mean?** A weighted assessment of observed site properties. It does not predict ranking or guarantee citations. See [scoring methodology](scoring-methodology.md).

**Does this install into ChatGPT Work?** No. The local installer targets Codex's filesystem skills; Work manages skills separately.
