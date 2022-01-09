#!/bin/zsh

node_error_msg="Compilation error in "
vite_error_msg="File: "

WRITE_BUFFER_TO_FILE() {
  tmux copy-mode
  tmux capture-pane -S -  
  tmux save-buffer /tmp/tmux 
  tmux delete-buffer 
  tmux send-keys Enter
}

CHECK_FOR_LATEST_ERROR() {
  # WRITE_BUFFER_TO_FILE

  latest_error_type=""
  latest_error_line_number="" 
  latest_error_error_msg=""

  node_error_line_numbers=$(awk '/Compilation error/ {print FNR}' /tmp/tmux)
  vite_error_line_numbers=$(awk '/File: / {print FNR}' /tmp/tmux)

  latest_node_error_line_number=$(echo "$node_error_line_numbers[*]" | sort -nr | head -n 1)
  latest_vite_error_line_number=$(echo "$vite_error_line_numbers[*]" | sort -nr | head -n 1)

  if [ $latest_node_error_line_number -lt $latest_vite_error_line_number ]; then
    latest_error_type="vite"
    latest_error_line_number=$latest_vite_error_line_number
    latest_error_error_msg=$vite_error_msg

  else
    latest_error_type="node"
    latest_error_line_number=$latest_node_error_line_number
    latest_error_error_msg=$node_error_msg
  fi

  latest_error_line=$(sed "${latest_error_line_number}q;d" /tmp/tmux | awk '{ print substr ($0, 5 ) }')
  latest_error_filepath=$(echo $latest_error_line | sed s/"$latest_error_error_msg"// | awk '{$1=$1};1')

  OPEN_FILE_AT_LINE $latest_error_filepath 

}


OPEN_FILE_AT_LINE() {
  # Open file at line
  tmux split -v
  # tmux send-keys 'cat '$FILE
  result=$(echo "$1" | tr '\r' ' ')
  fileName=$(echo $result | cut -d' ' -f1)
  
  if [ $# -eq 1 ]; then 
    nvr --remote $fileName
  else
    nvr --remote +$2 $fileName
  fi

  sleep 1 
  nvr --remote-send ":call CocAction('diagnosticNext')<cr>"

  tmux kill-pane
  tmux select-pane -D
}

# WRITE_BUFFER_TO_FILE
CHECK_FOR_LATEST_ERROR



# FIND_LAST_VITE_ERROR() {

#   # Get file path 
#   tmux copy-mode
#   tmux send -X search-backward 'File: '
#   tmux send-keys w
#   tmux send-keys v
#   tmux send-keys $
#   tmux send-keys M-f y
#   FILE=$(clip)

#   # Get file number
#   tmux copy-mode
#   tmux send -X search-backward 'File: '
#   tmux send-keys j
#   tmux send-keys j
#   tmux send-keys j
#   tmux send-keys v
#   tmux send-keys l
#   tmux send-keys l
#   tmux send-keys l
#   tmux send-keys M-f y
#   NUM=$(clip)
  
#   OPEN_FILE_AT_LINE $FILE $NUM

#   # tmux select-pane -t 0

# }

# FIND_LAST_EXPRESS_ERROR() {
  
#     # Get file path 
#     tmux copy-mode
#     tmux send -X search-backward 'Compilation error in'
#     tmux send-keys w
#     tmux send-keys w
#     tmux send-keys w
#     tmux send-keys v
#     tmux send-keys $
#     tmux send-keys M-f y
#     FILE=$(clip)

#     OPEN_FILE_AT_LINE $FILE 
  
#     # tmux select-pane -t 0
# }

