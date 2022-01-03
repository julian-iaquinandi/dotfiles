#!/bin/zsh


COPY_ERRORS() {
  tmux send -X search-backward 'problems ('
  tmux send-keys n
  tmux send -X search-forward 'ERROR in'
  tmux send-keys j
  tmux send-keys V
  tmux send -X search-forward 'problems ('
  tmux send-keys kk
  tmux send-keys y
}

OPEN_FILE_WITH_VIM() {
  nvr --remote $1
}

COPY_ERRORS

# OPEN_FILE_WITH_VIM file1

# tmux paste-buffer | clip.exe
#

