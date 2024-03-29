# dotfiles
Dotfiles for my home directory

# Installation
```shell
zsh <(curl -s https://raw.githubusercontent.com/krmckone/dotfiles/main/install.sh)
```

This will
1. Clone this repo to `~/.dotfiles`
2. Backup any of the considered dotfiles if they are not symlinks
3. Symlink files from ~/.dotfiles to ~


My `.zshrc` will install my [krm-helpers](https://github.com/krmckone/krm-helpers) and my [nvim-config](https://github.com/krmckone/nvim-config)
and also keep them up to date.

`.zshrc` exposes a function `dotfiles_update` that pulls latest from master.

To add a new dotfile, add it to the repo and append its name to the `dotFiles`
array in `install.sh`
