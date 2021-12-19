#!/bin/bash

# . ./init.sh
. ./functions.sh

CURRENT_DIR=$(pwd)

# Installs

INSTALL_BASE() {
  sudo apt install curl wget stow build-essential -y
}

INSTALL_NEOVIM() {
  NVIM_DIR=~/dotfiles/app/nvim.0.7
  sudo cp $NVIM_DIR/usr/bin/* /usr/bin
  sudo cp $NVIM_DIR/usr/lib/* /usr/lib
  sudo cp $NVIM_DIR/usr/man/* /usr/man
  sudo cp $NVIM_DIR/usr/share/* /usr/share
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

CMD_EXISTS curl INSTALL_BASE
CMD_EXISTS nvim INSTALL_NEOVIM
FILE_EXISTS oh-my-zsh INSTALL_OHMYZSH ~/.oh-my-zsh/plugins/antigen.zsh 
DIR_EXISTS nvm INSTALL_NVM ~/.nvm

PRINT_INSTALL_SUMMARY
