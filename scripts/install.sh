#!/bin/bash

# . ./init.sh
. ./functions.sh

CURRENT_DIR=$(pwd)

# Installs

INSTALL_BASE() {
  sudo apt update
  sudo apt upgrade
  sudo apt install curl -y &&
  sudo apt install wget -y &&
  sudo apt install stow -y &&
  sudo apt install build-essential -y &&
  sudo apt install tree -y &&
  sudo apt install zsh -y
}

INSTALL_NEOVIM() {
  NVIM_DIR=~/dotfiles/app/nvim.0.7
  sudo cp $NVIM_DIR/usr/bin/* /usr/bin
  sudo cp $NVIM_DIR/usr/lib/* /usr/lib
  sudo cp $NVIM_DIR/usr/man/* /usr/man
  sudo cp $NVIM_DIR/usr/share/* /usr/share
  git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

}

INSTALL_OHMYZSH() {
  sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

INSTALL_ANTIGEN() {
  cd ~/.oh-my-zsh/plugins
  curl -L git.io/antigen > antigen.zsh
  cd $CURRENT_DIR
}

INSTALL_NVM() {
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
}

# Installer

CMD_EXISTS zsh INSTALL_BASE
CMD_EXISTS nvim INSTALL_NEOVIM
DIR_EXISTS oh-my-zsh INSTALL_ANTIGEN ~/.oh-my-zsh
FILE_EXISTS antigen INSTALL_ANTIGEN ~/.oh-my-zsh/plugins/antigen.zsh
DIR_EXISTS nvm INSTALL_NVM ~/.nvm

PRINT_INSTALL_SUMMARY
