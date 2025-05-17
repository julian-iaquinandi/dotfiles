#!/bin/bash
# filepath: /home/kd/.config/hypr/scripts/focus_or_workspace.sh

# Enable debugging
echo "Script started" > /tmp/focus_debug.log

# Get current workspace ID
CURRENT_WORKSPACE=$(hyprctl activeworkspace -j | jq '.id')
echo "Current workspace: $CURRENT_WORKSPACE" >> /tmp/focus_debug.log

# Get current window address and position
CURRENT_WINDOW_ADDRESS=$(hyprctl activewindow -j | jq -r '.address')
CURRENT_WINDOW_POSITION=$(hyprctl activewindow -j | jq -r '.at[0]')
echo "Current window: $CURRENT_WINDOW_ADDRESS at position: $CURRENT_WINDOW_POSITION" >> /tmp/focus_debug.log

# Get all windows on this workspace sorted by horizontal position
WINDOWS_JSON=$(hyprctl clients -j | jq "[.[] | select(.workspace.id == $CURRENT_WORKSPACE and .address != \"$CURRENT_WINDOW_ADDRESS\")] | sort_by(.at[0])")
echo "Windows on workspace: $WINDOWS_JSON" >> /tmp/focus_debug.log

# Find the next window to the right
NEXT_WINDOW=$(echo "$WINDOWS_JSON" | jq -r "[.[] | select(.at[0] > $CURRENT_WINDOW_POSITION)] | sort_by(.at[0]) | .[0].address // \"none\"")
echo "Next window to right: $NEXT_WINDOW" >> /tmp/focus_debug.log

# Count windows on current workspace
WINDOWS_ON_WORKSPACE=$(hyprctl clients -j | jq "[.[] | select(.workspace.id == $CURRENT_WORKSPACE)] | length")
echo "Total windows on workspace: $WINDOWS_ON_WORKSPACE" >> /tmp/focus_debug.log

# If there's a window to our right, focus it
if [ "$NEXT_WINDOW" != "none" ] && [ "$NEXT_WINDOW" != "null" ]; then
    echo "Focusing window to the right: $NEXT_WINDOW" >> /tmp/focus_debug.log
    hyprctl dispatch focuswindow address:$NEXT_WINDOW
else
    # If no window to the right, go to next workspace
    echo "No window to the right, switching workspace" >> /tmp/focus_debug.log
    hyprctl dispatch workspace +1
fi