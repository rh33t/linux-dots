#!/usr/bin/env bash
set -euo pipefail

PLAYER="spotify"
FORMAT="{{ title }}"

truncate_text() {
  local text="$1"
  if [ ${#text} -gt 20 ]; then
    echo "${text:0:17}..."
  else
    echo "$text"
  fi
}

if STATUS=$(playerctl --player="$PLAYER" status 2>/dev/null); then
  :
else
  STATUS="No player is running"
fi

if [ "${1:-}" == "--status" ]; then
  echo "$STATUS"
else
  if [ "$STATUS" = "Stopped" ] || [ "$STATUS" = "No player is running" ]; then
    echo ""
  else
    TITLE=$(playerctl --player="$PLAYER" metadata --format "$FORMAT" | sed -e 's/&/\&amp;/g' -e 's/</\&lt;/g' -e 's/>/\&gt;/g')
    truncate_text "$TITLE"
  fi
fi
