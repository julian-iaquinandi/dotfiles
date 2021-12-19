#!/bin/bash

INSTALLED=()
NOT_INSTALLED=()

# Check if command exists and if not install
# $1 = command name
# $2 = install function
INSTALL_CMD() {

  if [ -x "$(command -v $1)" ]; then
    echo "✔️ $1 is already installed" >&2
    INSTALLED+=($1) 
  else
    echo "❗ $1 is not installed"
    NOT_INSTALLED+=($1) 
    $2
  fi
}

# Check if dir exists and if not install 
# $1 = command name
# $2 = install function
# $3 = directory
INSTALL_DIR() {
  if [ -d $3 ]; then 
    echo "✔️ $1 is already installed" >&2
    INSTALLED+=($1) 
  else 
    echo "❗ $1 is not installed"
    NOT_INSTALLED+=($1) 
    $2
  fi 
}

PRINT_SUMMARY() {

  if [ "${#INSTALLED[@]}" -gt 0 ]; then
    echo ''
    echo 'Already Installed'
    echo '---------------------'
    for value in "${INSTALLED[@]}"
    do
        echo '✔️' $value
    done
    echo ''
  fi

  if [ "${#NOT_INSTALLED[@]}" -gt 0 ]; then
    echo ''
    echo 'Installed'
    echo '---------------------'
    for value in "${NOT_INSTALLED[@]}"
    do
        echo '✔️' $value
    done
    echo ''
  fi
}