#!/bin/bash

. installs.sh
. functions.sh
. configure.sh


# Installs
CMD_EXISTS zsh INSTALL_BASE
CMD_EXISTS nvim INSTALL_NEOVIM
DIR_EXISTS oh-my-zsh INSTALL_OHMYZSH ~/.oh-my-zsh
FILE_EXISTS antigen INSTALL_ANTIGEN ~/.oh-my-zsh/plugins/antigen.zsh
DIR_EXISTS nvm INSTALL_NVM ~/.nvm
CMD_EXISTS python3 INSTALL_PYTHON
CMD_EXISTS ripgrep INSTALL_RIPGREP
CMD_EXISTS fzf INSTALL_FZF

# Config
TEXT_EXISTS zsh CONFIG_ZSH ~/.zshrc "source ~/.config/zsh/.zshrc"
DIR_EXISTS nvim CONFIG_NEOVIM ~/.config/nvim

PRINT_INSTALL_SUMMARY
PRINT_CONFIGURE_SUMMARY

echo "!! run 'zsh', when the shell has updated run POST_INSTALL"
