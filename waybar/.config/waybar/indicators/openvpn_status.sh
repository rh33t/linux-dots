#!/usr/bin/env bash
set -euo pipefail

pid=$(pgrep openvpn$ || true)
if [ -n "$pid" ]; then
  connection=$(pgrep -a openvpn$ | head -n 1 | awk '{print $NF}' | xargs basename | cut -d '.' -f 1)
  echo " openvpn: $connection"
else
  echo ""
fi
