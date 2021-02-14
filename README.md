# dot-files

jimmys public dot-files and bootstrapper to make life easier. one can use this to quickly bootstrap a vanilla mac, debian based distro.

# to use

ensure that you have git, and curl or wget;

```bash
# check dependencies
command -V git || echo "git tool not found"
command -V curl || echo "curl tool not found"
command -V wget || echo "wget tool not found"

# quick start - to clone the repo and run the make to see menu
cd ~
git clone https://github.com/mirageglobe/dot-files.git
```

```bash
# === misc commands

# to only get the makefile
curl -D - https://raw.githubusercontent.com/mirageglobe/dot-files/master/Makefile > ~/Makefile

# to curl font
curl -fLo "<FONT NAME> Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/<FONT_PATH>/complete/<FONT_NAME>%20Nerd%20Font%20Complete.otf
```

# to contribute

- ensure nothing sensitive is committed to this repo
- assume that homebrew is not available and setups are compiled binaries or scripts

# to do

- basic ssh key gen for local
- create home downloads for files
- switch to sdkman - for groovy/java ( curl -s get.sdkman.io | bash )
- vim fix ale - https://github.com/dense-analysis/ale#usage-completion
- fira source (https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/FiraCode.zip)
- noto source (https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Noto.zip)
- aws vault (https://github.com/99designs/aws-vault/releases)
- [x] use hawkeye scanner
- [x] use homebrew - bat cat source (https://github.com/sharkdp/bat/releases/latest)
- [x] use homebrew - rg grep source (https://github.com/BurntSushi/ripgrep/releases/latest)
- [x] include path builder for tooling
- [x] include tool copy to folder
- [x] vim add coc (conquerer of code https://github.com/neoclide/coc.nvim)

# references

- https://www.ubuntupit.com/best-vim-plugins-for-programming/
- https://github.com/tonsky/FiraCode
- https://www.nerdfonts.com/font-downloads
- https://gist.github.com/spicycode/1229612
