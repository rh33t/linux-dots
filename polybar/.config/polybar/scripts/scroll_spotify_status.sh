#!/bin/bash

status_script="$(dirname "$0")/get_spotify_status.sh"

truncate_text() {
  local text="$1"
  if [ ${#text} -gt 20 ]; then
    echo "${text:0:17}..."
  else
    echo "$text"
  fi
}

if command -v zscroll >/dev/null 2>&1; then
  # zscroll exists, run it
  zscroll -l 20 \
    --delay 0.1 \
    --scroll-padding "  " \
    --match-command "$status_script --status" \
    --match-text "Playing" "--scroll 1" \
    --match-text "Paused" "--scroll 0" \
    --update-check true "$status_script" &
  wait
else
  # zscroll not found, just echo truncated output
  status=$("$status_script")
  truncated=$(truncate_text "$status")
  echo "$truncated"
fi
