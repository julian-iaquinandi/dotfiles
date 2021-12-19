#!/bin/bash

set -e
if grep -qEi "(Microsoft|WSL)" /proc/version &> /dev/null ; then
    echo "Windows 10 Bash"
    export HOMEDIR=$(wslpath "$(wslvar USERPROFILE)")
else
    export HOMEDIR="~"
    echo "Not Windows"
fi


