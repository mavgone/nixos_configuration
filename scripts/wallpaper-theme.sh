#!/usr/bin/env bash

set -euo pipefail

WALLPAPER="$1"
THEME_FILE="$HOME/.config/nvim/current-theme"

JSON=$(matugen image "$WALLPAPER" --source-color-index 0 --json hex)

COLOR=$(printf '%s' "$JSON" | python3 -c '
import json
import sys

data = json.load(sys.stdin)
print(data["colors"]["source_color"]["default"]["color"])
')

if [[ -z "$COLOR" || "$COLOR" == "null" ]]; then
  echo "Could not get source_color from matugen"
  exit 1
fi

read H S L < <(
  python3 - "$COLOR" <<'PY'
import sys
import colorsys

color = sys.argv[1].lstrip("#")

r = int(color[0:2], 16) / 255
g = int(color[2:4], 16) / 255
b = int(color[4:6], 16) / 255

h, l, s = colorsys.rgb_to_hls(r, g, b)

print(
    round(h * 360),
    round(s * 100),
    round(l * 100)
)
PY
)

echo "Wallpaper color: $COLOR"
echo "H: $H  S: $S  L: $L"

if ((S < 15)); then
  THEME="catppuccin"

elif ((H < 20)); then
  THEME="rose-pine"

elif ((H < 55)); then
  THEME="gruvbox"

elif ((H < 80)); then
  THEME="kanagawa"

elif ((H < 160)); then
  THEME="matrix"

elif ((H < 200)); then
  THEME="nord"

elif ((H < 255)); then
  THEME="tokyonight"

elif ((H < 320)); then
  THEME="dracula"

else
  THEME="rose-pine"
fi

echo "$THEME" >"$THEME_FILE"

echo "Selected theme: $THEME"
