# skills

persona and protocol skills for AI coding assistants.

## skills

| skill | description |
| :--- | :--- |
| architect | high-cognition engineering protocol; structural planning and SOLID/DRY enforcement |
| caveman | ultra-compressed communication mode; cuts ~75% token usage |
| cove | efficiency protocol; minimises token usage and removes conversational filler |
| ironbeard | minimalist engineering protocol; zero-prose, Go/Bash/Python focused |
| the-beard | laconic senior SRE persona; functional programming and unix philosophy |

## structure

each skill folder contains:

- `SKILL.md` — skill definition for Claude Code and OpenCode
- `GEMINI.md` — skill definition for Gemini CLI
- `gemini-extension.json` — Gemini extension manifest

all `SKILL.md` files include `disable-model-invocation: true` to prevent automatic loading — skills must be explicitly invoked by the user (e.g. `/ironbeard`).

## deploy

```bash
make llm-deploy-skills
```

deploys all skills to:
- `~/.claude/skills/<skill>/` — Claude Code
- `~/.config/opencode/skills/<skill>/` — OpenCode
- `~/.gemini/extensions/<skill>/` — Gemini CLI
