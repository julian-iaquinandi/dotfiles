#!/bin/bash

# Input argument: direction
DIRECTION=$1

CURRENT_WORKSPACE=$(aerospace list-windows --focused)
aerospace focus --boundaries workspace --boundaries-action stop "$DIRECTION"
NEW_WORKSPACE=$(aerospace list-windows --focused)

if [ "$CURRENT_WORKSPACE" == "$NEW_WORKSPACE" ]; then
	aerospace focus-monitor "$DIRECTION"
fi
