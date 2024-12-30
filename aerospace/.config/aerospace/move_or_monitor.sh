#!/bin/bash

# Input argument: direction
DIRECTION=$1

CURRENT_WORKSPACE=$(aerospace list-windows --focused)
aerospace move "$DIRECTION"
NEW_WORKSPACE=$(aerospace list-windows --focused)

if [ "$CURRENT_WORKSPACE" == "$NEW_WORKSPACE" ]; then
	aerospace move-node-to-monitor "$DIRECTION"
fi
