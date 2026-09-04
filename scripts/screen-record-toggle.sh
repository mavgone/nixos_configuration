#!/usr/bin/env bash

PIDFILE="$HOME/.cache/gpu-screen-recorder.pid"
OUTPUT_DIR="$HOME/Videos/Screen-Record"

mkdir -p "$OUTPUT_DIR"
mkdir -p "$(dirname "$PIDFILE")"

if [ -f "$PIDFILE" ]; then
  PID=$(cat "$PIDFILE")

  if kill -0 "$PID" 2>/dev/null; then
    kill -INT "$PID"

    for _ in {1..50}; do
      if ! kill -0 "$PID" 2>/dev/null; then
        break
      fi
      sleep 0.1
    done

    rm -f "$PIDFILE"
    notify-send "Screen recording" "Recording stopped"
    exit 0
  else
    rm -f "$PIDFILE"
  fi
fi

MONITOR=$(niri msg -j workspaces |
  jq -r '.[] | select(.is_focused == true) | .output')

if [ -z "$MONITOR" ] || [ "$MONITOR" = "null" ]; then
  notify-send "Screen recording" "Could not determine monitor"
  exit 1
fi

OUTPUT="$OUTPUT_DIR/record-$(date +%Y-%m-%d_%H-%M-%S).mp4"

gpu-screen-recorder \
  -w "$MONITOR" \
  -f 60 \
  -q high \
  -k h264 \
  -c mp4 \
  -o "$OUTPUT" &

PID=$!
echo "$PID" >"$PIDFILE"

notify-send "Screen recording 🔴" "Recording started on $MONITOR"
