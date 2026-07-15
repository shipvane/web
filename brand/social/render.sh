#!/usr/bin/env bash
# Render every SVG under brand/social/ to a same-name PNG at its intrinsic size,
# using headless Chrome (so text renders in real Avenir Next on macOS). Idempotent.
#
#   ./render.sh                 # render all
#   ./render.sh x/*.svg         # render specific files
set -euo pipefail

CHROME="${CHROME:-/Applications/Google Chrome.app/Contents/MacOS/Google Chrome}"
[[ -x "$CHROME" ]] || { echo "Chrome not found at: $CHROME (set \$CHROME)"; exit 1; }

cd "$(dirname "$0")"
# bash 3.2 (macOS default) has no mapfile — collect portably.
svgs=()
if [[ $# -gt 0 ]]; then
  svgs=("$@")
else
  while IFS= read -r f; do svgs+=("$f"); done < <(find . -name '*.svg' | sort)
fi
tmp="$(mktemp -d)"; trap 'rm -rf "$tmp"' EXIT

for svg in "${svgs[@]}"; do
  # pull width/height from the SVG's root attributes
  read -r w h < <(sed -n '1,3p' "$svg" | grep -oE 'width="[0-9]+" height="[0-9]+"' | head -1 | grep -oE '[0-9]+' | paste -sd' ' -)
  [[ -n "${w:-}" && -n "${h:-}" ]] || { echo "skip (no size): $svg"; continue; }
  base="$(basename "$svg" .svg)"; out="${svg%.svg}.png"; html="$tmp/$base.html"
  { printf '<!doctype html><meta charset=utf-8><style>*{margin:0;padding:0}html,body{overflow:hidden;background:transparent}svg{display:block}</style>'; cat "$svg"; } > "$html"
  "$CHROME" --headless --disable-gpu --hide-scrollbars --force-device-scale-factor=1 \
    --default-background-color=00000000 --window-size="$w,$h" \
    --screenshot="$out" "file://$html" >/dev/null 2>&1
  echo "rendered $out (${w}x${h})"
done
