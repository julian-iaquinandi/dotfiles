#!/bin/bash

. ./functions.sh

CURRENT_DIR=$(pwd)

CONFIG_ZSH() {
  cd ~/dotfiles
  stow zsh
  echo 'source ~/.config/zsh/.zshrc' >> ~/.zshrc 
}


CONFIGURE_TEXT zsh CONFIG_ZSH ~/.zshrc "source ~/.config/zsh/.zshrc"

PRINT_CONFIGURE_SUMMARY