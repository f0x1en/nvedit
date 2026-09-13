#!/usr/bin/env bash
set -euo pipefail

# nvedit installer - NvChad v2.5 base
CFG="${HOME}/.config/nvim"

echo "▸ Checking dependencies..."
for cmd in git nvim; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "MISSING: $cmd"
    exit 1
  fi
done

echo "▸ Setting up config..."
mkdir -p "${CFG}"
# Use current repo dir as source
cp -r ./* "${CFG}/"

echo "▸ Installing plugins..."
nvim --headless "+Lazy sync" +qall

echo "Done. Launch with 'nvim'"
