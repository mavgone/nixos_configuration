#!/usr/bin/env bash

HUE=$(cat "$HOME/.config/nvim/wallpaper-hue")

if (( HUE < 20 )); then
    THEME="rose-pine"
elif (( HUE < 55 )); then
    THEME="gruvbox"
elif (( HUE < 80 )); then
    THEME="kanagawa"
elif (( HUE < 160 )); then
    THEME="matrix"
elif (( HUE < 200 )); then
    THEME="nord"
elif (( HUE < 255 )); then
    THEME="tokyonight"
elif (( HUE < 320 )); then
    THEME="dracula"
else
    THEME="rose-pine"
fi

echo "$THEME" > "$HOME/.config/nvim/current-theme"

echo "Hue: $HUE"
echo "Theme: $THEME"
