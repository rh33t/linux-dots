#!/bin/sh
pid=$(pgrep openvpn$)
if [ -n "$pid" ]; then
  connection=$(pgrep -a openvpn$ | head -n 1 | awk '{print $NF}' | xargs basename | cut -d '.' -f 1)
  echo "%{F#ED7F22} vpn: $connection%{F-}"
else
  echo ""
fi
