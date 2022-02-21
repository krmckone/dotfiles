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
