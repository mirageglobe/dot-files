# skills

persona and protocol skills for AI coding assistants.

## skills

| skill     | description                                                                        |
| :-------- | :--------------------------------------------------------------------------------- |
| architect | high-cognition engineering protocol; structural planning and SOLID/DRY enforcement |
| caveman   | ultra-compressed communication; cuts ~75% token usage via caveman speech           |
| cove      | efficiency protocol; minimises token usage and removes conversational filler       |
| davinci   | creative and design-focused persona                                                |
| ironbeard | minimalist engineering protocol; zero-prose, Go/Bash/Python focused                |
| scrooge   | token-miser mode; eliminates redundancy in both tool reads and prose output        |
| the-beard | laconic senior SRE persona; functional programming and unix philosophy             |

## structure

each skill folder contains:

- `SKILL.md` — skill definition for Claude Code and OpenCode
- `GEMINI.md` — skill definition for Gemini CLI
- `gemini-extension.json` — Gemini extension manifest

all `SKILL.md` files include `disable-model-invocation: true` to prevent automatic loading — skills must be explicitly invoked by the user (e.g. `/ironbeard`).

## deploy

```bash
# deploy all skills
make deploy

# deploy a single skill
make deploy-ironbeard
```

deploys to:
- `~/.claude/skills/<skill>/SKILL.md` — Claude Code
- `~/.config/opencode/skills/<skill>/SKILL.md` — OpenCode

## gemini cli

gemini extensions must be registered explicitly via the cli — they are not copied by `make deploy`.

```bash
# register a skill as a gemini extension (run once per skill)
gemini extensions add ~/dot-files/skills/ironbeard

# list registered extensions
gemini extensions list
```

## invoking a skill

once deployed, invoke a skill by name in the assistant prompt:

```
/ironbeard
/scrooge
/caveman
```
