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
curl -fLo ~/Makefile https://raw.githubusercontent.com/mirageglobe/dot-files/master/Makefile

# Run make to see the menu
make help
```

> [!TIP]
> Use `make mac-common` or `make debian-common` to quickly install base dependencies and configurations.

### 4. Bash Completions
Add the following to your `~/.bashrc` or `~/.bash_profile`:
```bash
# Git completion
[ -f ~/dot-files/dot.completion.git.bash ] && source ~/dot-files/dot.completion.git.bash

# Makefile menu completion
[ -f ~/dot-files/dot.completion.make-menu.bash ] && source ~/dot-files/dot.completion.make-menu.bash
```

## 🤝 Contribution

- 🛡️ **Security**: Ensure NO sensitive data (keys, passwords) is ever committed.
- 📦 **Independence**: Favor standalone scripts or setup binaries over heavy dependency managers where possible.

## 🔗 Reference

- [Vim Plugins for Programming](https://www.ubuntupit.com/best-vim-plugins-for-programming/)
- [Fira Code Font](https://github.com/tonsky/FiraCode)
- [Nerd Fonts](https://www.nerdfonts.com/font-downloads)
- [Tmux Cheat Sheet](https://gist.github.com/spicycode/1229612)
