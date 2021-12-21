#!/bin/bash

. ~/dotfiles/scripts/functions.sh

CURRENT_DIR=$(pwd)

CONFIG_ZSH() {
  cd ~/dotfiles
  stow zsh
  echo 'source ~/.config/zsh/.zshrc' >> ~/.zshrc 
}

CONFIG_NEOVIM() {
  cd ~/dotfiles
  stow nvim
  stow git
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

POST_INSTALL() {
	nvm install node
	sudo apt install python3-pip -y
	python3 -m pip install --user --upgrade pynvim
  DIR_EXISTS nvim CONFIG_COC ~/.config/coc
  chsh -s $(which zsh)
}
