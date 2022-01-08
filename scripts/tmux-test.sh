#!/bin/zsh

FIND_LAST_VITE_ERROR() {

  tmux send -X search-backward 'File: '
  tmux send-keys w
  tmux send-keys v
  tmux send-keys $
  copy-pipe-and-cancel 'xargs -I{} nvr --remote {}' 

  
  tmux send -X search-backward 'File: '
  tmux send-keys j
  tmux send-keys j
  tmux send-keys j
  tmux send-keys v
  tmux send-keys l
  tmux send-keys l
  tmux send-keys l
  tmux send-keys M-f y
  NUM=$(tmux)
}

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

