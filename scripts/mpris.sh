#!/usr/bin/env bash

MAX=25

status=$(playerctl status 2>/dev/null)
media=$(playerctl metadata --format '{{artist}} - {{title}}' 2>/dev/null)

if [[ -z "$media" ]]; then
  printf ' Nothing playing    '
  exit 0
fi

if ((${#media} > MAX)); then
  media="${media:0:MAX}..."
fi

if [[ "$status" == "Playing" ]]; then
  icon="⏸  "
else
  icon=" ▶    "
fi

printf '%s %s\n' "$media" "$icon"
