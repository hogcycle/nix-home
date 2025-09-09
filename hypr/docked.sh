#!/usr/bin/env bash
# docked

WORKSPACES=$(hyprctl -j workspaces | jq -r 'map(select(.name | contains("special") | not)) | .[] | .id')
MONITOR=$(hyprctl monitors -j | jq -r '.[] | select(.name != "eDP-1") | .name')
for WORKSPACE in $WORKSPACES; do
	hyprctl dispatch moveworkspacetomonitor $WORKSPACE $MONITOR 
done
