#!/bin/bash

# Check if the argument is "next" or "prev"
if [[ "$1" != "next" && "$1" != "prev" ]]; then
  echo "Usage: $0 [next|prev]"
  exit 1
fi

# Check if the second argument is "move"
move_window=false
if [[ "$2" == "move" ]]; then
  move_window=true
fi

# Get the current workspace
current_workspace=$(swaymsg -t get_workspaces | jq -r '.[] | select(.focused==true).name')

# Extract the numeric part of the workspace name
workspace_number=$(echo "$current_workspace" | grep -o '[0-9]\+')

# Determine the next or previous workspace number
if [[ "$1" == "next" ]]; then
  target_workspace_number=$((workspace_number + 1))
else
  target_workspace_number=$((workspace_number - 1))
fi

# Move the current window to the target workspace if "move" is specified
if [[ "$move_window" == true ]]; then
  swaymsg move container to workspace number "$target_workspace_number"
fi

# Switch to the target workspace
swaymsg workspace number "$target_workspace_number"
