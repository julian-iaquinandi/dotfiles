#!/bin/bash

. installs.sh
. functions.sh
. configure.sh


POST_INSTALL() {
	nvm install node
	sudo apt install python3-pip -y
	python3 -m pip install --user --upgrade pynvim
  DIR_EXISTS nvim CONFIG_COC ~/.config/coc
}


# Installs
CMD_EXISTS zsh INSTALL_BASE
CMD_EXISTS nvim INSTALL_NEOVIM
DIR_EXISTS oh-my-zsh INSTALL_OHMYZSH ~/.oh-my-zsh
FILE_EXISTS antigen INSTALL_ANTIGEN ~/.oh-my-zsh/plugins/antigen.zsh
DIR_EXISTS nvm INSTALL_NVM ~/.nvm
CMD_EXISTS python3 INSTALL_PYTHON
CMD_EXISTS ripgrep INSTALL_RIPGREP

# Config
TEXT_EXISTS zsh CONFIG_ZSH ~/.zshrc "source ~/.config/zsh/.zshrc"
DIR_EXISTS nvim CONFIG_NEOVIM ~/.config/nvim

PRINT_INSTALL_SUMMARY
PRINT_CONFIGURE_SUMMARY

echo "run 'zsh', when the shell has updated run POST_INSTALL"
