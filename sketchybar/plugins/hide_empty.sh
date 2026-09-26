#!/usr/bin/env bash
FOCUSED="${FOCUSED_WORKSPACE:-$(aerospace list-workspaces --focused)}"
NONEMPTY=$(aerospace list-workspaces --monitor all --empty no)

for sid in $(aerospace list-workspaces --all); do
  if echo "$NONEMPTY" | grep -qx "$sid" || [ "$sid" = "$FOCUSED" ]; then
    sketchybar --set "space.$sid" drawing=on
  else
    sketchybar --set "space.$sid" drawing=off
  fi
done
