#!/usr/bin/env bash
# undocked

hyprctl monitor eDP-1 enable
WORKSPACES=$(hyprctl -j workspaces | jq -r 'map(select(.name | contains("special") | not)) | .[] | .id')
for WORKSPACE in $WORKSPACES; do
	hyprctl dispatch moveworkspacetomonitor $WORKSPACE eDP-1 
done

