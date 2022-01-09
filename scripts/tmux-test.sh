#!/bin/zsh

FIND_LAST_VITE_ERROR() {

  # Get file path 
  tmux copy-mode
  tmux send -X search-backward 'File: '
  tmux send-keys w
  tmux send-keys v
  tmux send-keys $
  tmux send-keys M-f y
  FILE=$(clip)


  # Get file number
  tmux copy-mode
  tmux send -X search-backward 'File: '
  tmux send-keys j
  tmux send-keys j
  tmux send-keys j
  tmux send-keys v
  tmux send-keys l
  tmux send-keys l
  tmux send-keys l
  tmux send-keys M-f y
  NUM=$(clip)
  
  OPEN_FILE_AT_LINE $FILE:$NUM

  tmux select-pane -t 0

}

OPEN_FILE_AT_LINE() {
  # Open file at line
  tmux split -v
  # tmux send-keys 'cat '$FILE
  result=$(echo "$1" | tr '\r' ' ')
  fileName=$(echo $result | cut -d' ' -f1)

  nvr --remote +$2 $fileName
  tmux kill-pane
}

# COPY_ERRORS() {
#   tmux send -X search-backward 'problems ('
#   tmux send-keys n
#   tmux send -X search-forward 'ERROR in'
#   tmux send-keys j
#   tmux send-keys V
#   tmux send -X search-forward 'problems ('
#   tmux send-keys kk
#   tmux send-keys y
# }

FIND_LAST_VITE_ERROR


