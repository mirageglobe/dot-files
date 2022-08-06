# dot-files

jimmys public dot-files and bootstrapper to make life easier. you can use this
to quickly bootstrap a vanilla mac or debian based distros.

## to use

```bash
# check dependencies
command -V git; command -V curl; command -V wget

# generate ssh key via ed25519 key pair ~/.ssh/id_ed25519 (recommended)
ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519 -C "changeme@example.com"

# generate RSA key pair ~/.ssh/id_rsa_standard (4096 bits)
ssh-keygen -b 4096 -t rsa -f ~/.ssh/id_rsa_standard -C "changeme@example.com"

# clone the repo and run the make to see menu
git clone https://github.com/mirageglobe/dot-files.git

# only get the makefile
curl -D - https://raw.githubusercontent.com/mirageglobe/dot-files/master/Makefile > ~/Makefile

# only get font
curl -fLo "<FONT NAME> Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/<FONT_PATH>/complete/<FONT_NAME>%20Nerd%20Font%20Complete.otf
```

bash completions

```bash
# include in ~/.bashrc

# for git completion
[ -f ~/dot-files/dot.completion.git.bash ] && source ~/dot-files/dot.completion.git.bash

# for make completion
[ -f ~/dot-files/dot.completion.make-menu.bash ] && source ~/dot-files/dot.completion.make-menu.bash
```

## to contribute

- ensure nothing sensitive is committed to this repo
- assume that homebrew is not available and setups are compiled binaries or scripts

## to do

- [] aws vault (<https://github.com/99designs/aws-vault/releases>)
- [] basic ssh key gen for local
- [] create home downloads for files
- [x] use sdkman - for groovy/java ( curl -s get.sdkman.io | bash )
- [x] vim fix ale - (<https://github.com/dense-analysis/ale#usage-completion>)
- [x] fira source (<https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/FiraCode.zip>)
- [x] noto source (<https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Noto.zip>)
- [x] use hawkeye scanner
- [x] use homebrew - bat cat source (<https://github.com/sharkdp/bat/releases/latest>)
- [x] use homebrew - rg grep source (<https://github.com/BurntSushi/ripgrep/releases/latest>)
- [x] include path builder for tooling
- [x] include tool copy to folder
- [x] vim add coc (<https://github.com/neoclide/coc.nvim>)

## reference

- <https://www.ubuntupit.com/best-vim-plugins-for-programming/>
- <https://github.com/tonsky/FiraCode>
- <https://www.nerdfonts.com/font-downloads>
- <https://gist.github.com/spicycode/1229612>
