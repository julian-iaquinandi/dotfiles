#!/bin/bash

# . ./init.sh
. ./functions.sh

CURRENT_DIR=$(pwd)

# Installs

INSTALL_CURL() {
  sudo apt install curl 
}

INSTALL_NEOVIM() {
  sudo add-apt-repository ppa:neovim-ppa/unstable -y
  sudo apt-get update -y
  sudo apt-get install neovim -y
}

INSTALL_OHMYZSH() {
  sudo apt-get install zsh tree -y
  sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  cd ~/.oh-my-zsh/plugins
  curl -L git.io/antigen > antigen.zsh
  cd $CURRENT_DIR
}

INSTALL_NVM() {
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
}


# Installer

INSTALL_CMD curl INSTALL_CURL
INSTALL_CMD nvim INSTALL_NEOVIM
INSTALL_DIR oh-my-zsh INSTALL_OHMYZSH ~/.oh-my-zsh 
INSTALL_DIR nvm INSTALL_NVM ~/.nvm

PRINT_INSTALL_SUMMARY
