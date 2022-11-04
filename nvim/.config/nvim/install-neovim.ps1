if($IsWindows) {
  cp -r ~/dotfiles/nvim/.config/* ~/AppData/Local/
  choco install -y neovim ripgrep
  choco install -y python3 --pre
  nvm install lts
  nvm use lts
} else {
  brew install neovim pyenv ripgrep
  pyenv install 3.9.2 
  nvm install lts
  nvm use lts
}

