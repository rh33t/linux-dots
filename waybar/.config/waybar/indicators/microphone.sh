#!/usr/bin/env bash
set -euo pipefail

if [[ $(hostname) == "susanoo" ]]; then
  source="alsa_input.usb-145f_Trust_GXT_232_Microphone-00.mono-fallback"
else
  source="alsa_input.pci-0000_00_1f.3.analog-stereo"
fi

toggle_mute() {
  status=$(pactl get-source-mute "$source" | cut -d ":" -f2 | tr -d " ")

  if [[ $status == "no" ]]; then
    pactl set-source-mute "$source" true
    notify-send -i audio-input-microphone-muted "Mic muted"
  else
    pactl set-source-mute "$source" false
    notify-send -i audio-input-microphone "Mic unmuted"
  fi
}

ICON_UNMUTED=$' '
ICON_MUTED=$' '

check_status() {
  status=$(pactl get-source-mute "$source" | cut -d ":" -f2 | tr -d " ")
  if [[ $status == "no" ]]; then
    echo "{\"text\": \"$ICON_UNMUTED\", \"class\": \"unmuted\"}"
  else
    echo "{\"text\": \"$ICON_MUTED\", \"class\": \"muted\"}"
  fi
}

case "${1:-}" in
toggle)
  toggle_mute
  ;;
status)
  check_status
  ;;
*)
  echo "Usage: $0 {toggle|status}"
  ;;
esac
