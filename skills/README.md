# skills

persona and protocol skills for AI coding assistants.

## skills

| skill     | description                                                                             |
| :-------- | :-------------------------------------------------------------------------------------- |
| ironbeard | minimalist engineering protocol; zero-prose, Go/Bash/Python; visual + token-miser modes |

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
```
