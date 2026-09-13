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
cp -r ./* "${CFG}/"

# Proactive dependency install
if ! command -v rg >/dev/null 2>&1 || ! command -v fd >/dev/null 2>&1; then
  echo "▸ Attempting to install missing deps (rg/fd)..."
  if command -v apt >/dev/null 2>&1; then
    sudo apt update && sudo apt install -y ripgrep fd-find
  fi
fi

echo "▸ Installing plugins..."
nvim --headless "+Lazy sync" +qall

echo "Done. Launch with 'nvim'"
