if($IsMac) {
  brew install neovim pyenv ripgrep wget gzip
  pyenv install 3.9.2 
  nvm install lts
  nvm use lts
} else {
  cp -r ~/dotfiles/nvim/.config/* ~/AppData/Local/
  choco install -y neovim ripgrep llvm wget gzip
  choco install -y python3 --pre
  nvm install lts
  nvm use lts
  npm install -g neovim
}

