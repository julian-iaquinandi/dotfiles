#!/bin/bash

CURRENT_DIR=$(pwd)

# Installs

INSTALL_BASE() {
  sudo apt update -y &&
  sudo apt upgrade -y &&
  sudo apt install curl -y &&
  sudo apt install wget -y &&
  sudo apt install stow -y &&
  sudo apt install build-essential -y &&
  sudo apt install tree -y &&
  sudo apt install zsh -y
  sudo apt install trash-cli -y
  sudo apt install tmux -y
}

INSTALL_NEOVIM() {
  sudo apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
  git clone https://github.com/neovim/neovim
  cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
  sudo make install
}

INSTALL_OHMYZSH() {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
}

INSTALL_ANTIGEN() {
  cd ~/.oh-my-zsh/plugins
  curl -L git.io/antigen > antigen.zsh
  cd $CURRENT_DIR
}

INSTALL_NVM() {
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
}

INSTALL_PYTHON() {
  sudo add-apt-repository ppa:deadsnakes/ppa -y
  sudo apt update
  sudo apt install -y python3.8
  sudo apt install -y python3-pip
}

INSTALL_RIPGREP() {
  sudo apt-get install ripgrep -y
}

INSTALL_FZF() {
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --all --no-bash --no-fish
}


