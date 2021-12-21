#!/bin/bash

CURRENT_DIR=$(pwd)

CONFIG_ZSH() {
  cd ~/dotfiles
  stow zsh
  echo 'source ~/.config/zsh/.zshrc' >> ~/.zshrc 
}

CONFIG_NEOVIM() {
  cd ~/dotfiles
  stow nvim
  cd $CURRENT_DIR
#  nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
}

CONFIG_COC() {
  cd ~/dotfiles
  stow coc
  cd ~/.config/coc/extensions
  npm i

  cd $CURRENT_DIR
}

