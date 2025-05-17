#!/bin/bash

sink='@DEFAULT_AUDIO_SINK@'
inc="${1:-5%+}"

vol=$(wpctl get-volume "$sink" | awk '{print $2}')
vol_int=$(printf "%.0f" "$(echo "$vol * 100" | bc)")

if [[ "$inc" == *"+" ]]; then
  if [ "$vol_int" -lt 100 ]; then
    wpctl set-volume "$sink" "$inc"
  fi
else
  wpctl set-volume "$sink" "$inc"
fi
