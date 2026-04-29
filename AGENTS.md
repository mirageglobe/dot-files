# agents.md

Agent instructions for AI coding assistants working in this repository.

## Project

Dot-files repository containing shell configurations, editor settings, and tooling templates for macOS and Linux environments.

## Commands

```bash
make help        # list available make targets
make setup-all   # run all primary setups
make scan        # run security scans
```

## Guidelines

- Prefer editing existing files over creating new ones
- Keep shell scripts POSIX-compatible unless a specific shell (bash/zsh) is required
- Do not commit secrets, tokens, or credentials
- Follow existing naming conventions: `dot.<name>` for symlinked configs, `tpl.<platform>.<name>` for templates

## Repository Structure

- `dot.*` — files intended to be copied/symlinked into `$HOME` (e.g. `dot.vimrc`, `dot.coc-settings.json`)
- `tpl.*` — shell template/snippet files sourced into shell configs
- `Makefile` — task runner for install, lint, and scan targets
- `Brewfile` — Homebrew bundle for macOS dependencies
