# 🚀 dot-files

Jimmy's public dot-files and bootstrapper to make life easier. Quickly bootstrap vanilla macOS or Debian-based distributions.

## ✨ Features

- **Multi-platform support**: Tailored for macOS and Debian/Ubuntu.
- **Vim Configuration**: Rich Vim/Neovim setup with `coc.nvim`, `ale`, and more.
- **Modern CLI Tools**: Integrated with `bat`, `ripgrep`, `starship`, and `alacritty`.
- **System Utilities**: Configuration for `tmux`, `ranger`, and shell completions.
- **Python-ready**: Pre-configured `.python-version` and `.editorconfig`.

## 🛠️ Usage

### 1. Check Dependencies
Make sure you have the basics installed:
```bash
command -V git; command -V curl; command -V wget
```

### 2. Generate SSH Keys
Choose the recommended ED25519 or standard RSA:
```bash
# Recommended: ED25519
ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519 -C "your_email@example.com"

# Standard: RSA (4096 bits)
ssh-keygen -b 4096 -t rsa -f ~/.ssh/id_rsa_standard -C "your_email@example.com"
```

### 3. Bootstrap
Clone the repo and use the `Makefile` to see the available setup targets:
```bash
# Clone the repository
git clone https://github.com/mirageglobe/dot-files.git ~/dot-files

# Or just grab the Makefile to get started
curl -fLo ~/Makefile https://raw.githubusercontent.com/mirageglobe/dot-files/main/Makefile

# Run make to see the menu
make help
```

> [!TIP]
> Use `make setup-all` to install all primary configurations, or run individual `make setup-<tool>` targets.

### 4. Skills (AI Extensions)

Skills are reusable agent personas and workflows for Claude Code, Gemini CLI, and OpenCode.

```bash
# Deploy all skills to ~/.claude/skills, ~/.gemini/extensions, ~/.config/opencode/skills
cd ~/dot-files/skills && make deploy

# Deploy a single skill (e.g. ironbeard)
cd ~/dot-files/skills && make deploy-ironbeard
```

For Gemini CLI, skills are installed as extensions. You can also link a skill directory directly:
```bash
# Link a single skill as a Gemini extension (dev/local workflow)
gemini extensions link ~/dot-files/skills/ironbeard
```

Available skills (this repo):

| skill     | description                                                              |
| :-------- | :----------------------------------------------------------------------- |
| davinci   | minimalist visual thinker; renders diagrams and layouts in ASCII/Unicode  |
| ironbeard | minimalist engineering protocol; zero-prose, Go/Bash/Python, functional   |
| scrooge   | token-miser mode; eliminates all redundancy, full technical accuracy      |

Popular community skills (search GitHub for `claude skill` or `claude SKILL.md`):

| skill      | description                                                              |
| :--------- | :----------------------------------------------------------------------- |
| architect  | high-cognition engineering protocol for complex refactoring and design   |
| caveman    | ultra-compressed mode; cuts token usage ~75%, full technical accuracy    |
| cove       | efficiency-focused protocol for OpenCode; minimal tokens, concise diffs  |
| the-beard  | laconic senior SRE persona; functional programming, Unix philosophy      |

### 5. Bash Completions
Add the following to your `~/.bashrc` or `~/.bash_profile`:
```bash
# Git completion
[ -f ~/dot-files/tpl.completion.git.dot.bash ] && source ~/dot-files/tpl.completion.git.dot.bash

# Makefile menu completion
[ -f ~/dot-files/tpl.completion.make.dot.bash ] && source ~/dot-files/tpl.completion.make.dot.bash
```

## 🤝 Contribution

- 🛡️ **Security**: Ensure NO sensitive data (keys, passwords) is ever committed.
- 📦 **Independence**: Favor standalone scripts or setup binaries over heavy dependency managers where possible.

## 🔗 Reference

- [Vim Plugins for Programming](https://www.ubuntupit.com/best-vim-plugins-for-programming/)
- [Fira Code Font](https://github.com/tonsky/FiraCode)
- [Nerd Fonts](https://www.nerdfonts.com/font-downloads)
- [Tmux Cheat Sheet](https://gist.github.com/spicycode/1229612)
