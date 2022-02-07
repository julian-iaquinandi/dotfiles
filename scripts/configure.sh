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

CONFIG_TMUX() {
  cd ~/dotfiles
  stow tmux
  cd $CURRENT_DIR
}

CONFIG_LOCAL() {
  cd ~/dotfiles
  stow local
  cd $CURRENT_DIR
}

CONFIG_GIT() {
  cd ~/dotfiles
  stow git
  cd $CURRENT_DIR
}

NODE_PKGS() {
  npm i pnpm
  pnpm i -g @fsouza/prettierd
  pnpm i -g @types/node
  pnpm i -g eslint 
  pnpm i -g jest 
  pnpm i -g ts-node 
  pnpm i -g typescript 
  pnpm i -g vite 
}

POST_INSTALL() {
	nvm install node
  NODE_PKGS
	sudo apt install python3-pip -y
	python3 -m pip install --user --upgrade pynvim
  DIR_EXISTS nvim CONFIG_COC ~/.config/coc
  chsh -s $(which zsh)
}
