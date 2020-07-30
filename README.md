# dot-files

jimmys public dot-files to make life easier.

# to use

ensure that you have git, and curl or wget; you can check by using the following command in terminal.

```
# check dependancies
command -V git || echo "git tool not found"
command -V curl || echo "curl tool not found"
command -V wget || echo "wget tool not found"

# quick start - to clone the repo and run the make to see menu
git clone https://github.com/mirageglobe/dot-files.git
cd dot-files && make

# to curl the makefile
curl -D - https://raw.githubusercontent.com/mirageglobe/dot-files/master/Makefile > ~/Makefile

# to curl font
curl -fLo "<FONT NAME> Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/<FONT_PATH>/complete/<FONT_NAME>%20Nerd%20Font%20Complete.otf
```

# to contribute

- ensure nothing sensitive is committed to this repo
- assume that homebrew is not available and installs are mostly thru compiled binaries or scripts

# to do

- fox add hawkeye scanner for vulnerability
- setup coc in vim - https://github.com/neoclide/coc.nvim
- fix ale - https://github.com/dense-analysis/ale#usage-completion
- create home downloads for files
- fira source (https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/FiraCode.zip)
- noto source (https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Noto.zip)
- terminess (https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Terminus.zip)
- hasklug  (https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Hasklig.zip)
- aws vault (https://github.com/99designs/aws-vault/releases)
- include tool repo update
- add ruby lint : use ruby -wc
- add rails lint : use traceroute
- add php lint : php -l
- add php lint : phpstan
- add php lint : php_codesniffer
- add php standard lint : php_cs-fixer
- add php debugger : xdebug
- look at https://github.com/mozilla/cipherscan/blob/master/cipherscan
- refer to sdkman - for groovy ( curl -s get.sdkman.io | bash )
- [done] add python lint security : bandit - use hawkeye scanner
- [done] use homebrew - bat cat source (https://github.com/sharkdp/bat/releases/latest)
- [done] use homebrew - rg grep source (https://github.com/BurntSushi/ripgrep/releases/latest)
- [done] include path builder for tooling
- [done] include tool copy to folder
- [done] add coc (conquerer of code)

# references

- https://github.com/tonsky/FiraCode
- https://www.nerdfonts.com/font-downloads
- https://gist.github.com/spicycode/1229612

