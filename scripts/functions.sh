#!/bin/bash

SUMMARY_FOUND=()
SUMMARY_NOT_FOUND=()


# Check if command exists and if not install
# $1 = command name
# $2 = install function
CMD_EXISTS() {

  if [ -x "$(command -v $1)" ]; then
    echo "✔️ $1 is already installed" >&2
    SUMMARY_FOUND+=($1) 
  else
    echo "❗ $1 is not installed"
    SUMMARY_NOT_FOUND+=($1) 
    $2
  fi
}

# Check if dir exists and if not install 
# $1 = command name
# $2 = install function
# $3 = directory
DIR_EXISTS() {
  if [ -d $3 ]; then 
    echo "✔️ $1 is already installed" >&2
    SUMMARY_FOUND+=($1) 
  else 
    echo "❗ $1 is not installed"
    SUMMARY_NOT_FOUND+=($1) 
    $2
  fi 
}


# Check if file exists and if not install 
# $1 = command name
# $2 = install function
# $3 = directory
FILE_EXISTS() {
  if [ -f $3 ]; then 
    echo "✔️ $1 is already installed" >&2
    SUMMARY_FOUND+=($1) 
  else 
    echo "❗ $1 is not installed"
    SUMMARY_NOT_FOUND+=($1) 
    $2
  fi 
}

# Check for text in file
# $1 = command name
# $2 = install function
# $3 = file
# $4 = text
TEXT_EXISTS() {
  if grep -Fxq "$4" $3
  then
    # code if found
    echo "✔️ $1 is already configured" >&2
    SUMMARY_FOUND+=($1) 
  else
    # code if not found
    echo "❗ $1 is not configured"
    SUMMARY_NOT_FOUND+=($1)
    $2
  fi
}

PRINT_INSTALL_SUMMARY() {

  if [ "${#SUMMARY_FOUND[@]}" -gt 0 ]; then
    echo ''
    echo 'Already Installed'
    echo '---------------------'
    for value in "${SUMMARY_FOUND[@]}"
    do
        echo '✔️' $value
    done
    echo ''
  fi

  if [ "${#SUMMARY_NOT_FOUND[@]}" -gt 0 ]; then
    echo ''
    echo 'Installed'
    echo '---------------------'
    for value in "${SUMMARY_NOT_FOUND[@]}"
    do
        echo '✔️' $value
    done
    echo ''
  fi
}

PRINT_CONFIGURE_SUMMARY() {

  if [ "${#SUMMARY_FOUND[@]}" -gt 0 ]; then
    echo ''
    echo 'Already Configured'
    echo '---------------------'
    for value in "${SUMMARY_FOUND[@]}"
    do
        echo '✔️' $value
    done
    echo ''
  fi

  if [ "${#SUMMARY_NOT_FOUND[@]}" -gt 0 ]; then
    echo ''
    echo 'Configured'
    echo '---------------------'
    for value in "${SUMMARY_NOT_FOUND[@]}"
    do
        echo '✔️' $value
    done
    echo ''
  fi
}
