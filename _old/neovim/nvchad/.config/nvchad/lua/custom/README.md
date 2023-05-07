# KensleDev Neovim [NvChad](https://nvchad.github.io/) config

## Install

### 1. backup or remove old config

- backup

```shell
mv ~/.config/nvim ~/.config/NVIM.BAK
```

- remove older config

```shell
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
```

### 2. Installation NvChad (v2)

```sh
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
nvim
```

> This will init NVChad, when prompted choose no when asked if you want a example config

### 3. Add custom config

```sh
stow nvchad
```

or

> Copy the contents of this folder to ~/.config/nvim/lua/custom
