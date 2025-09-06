#!/usr/bin/env bash
# docked

WORKSPACES=$(hyprctl -j workspaces | jq -r 'map(select(.name | contains("special") | not)) | .[] | .id')
for WORKSPACE in $WORKSPACES; do
	hyprctl dispatch moveworkspacetomonitor $WORKSPACE DP-8
done
