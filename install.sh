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

# Clean existing config just in case
rm -rf "${CFG:?}/*"

# Copy necessary files
cp -r lua "${CFG}/"
cp init.lua lazy-lock.json "${CFG}/"

# Proactive dependency install (non-interactive)
if ! command -v rg >/dev/null 2>&1 || ! command -v fd >/dev/null 2>&1; then
  echo "▸ Warning: ripgrep/fd not found. Install for better experience:"
  echo "  apt: sudo apt install ripgrep fd-find"
  echo "  dnf: sudo dnf install ripgrep fd-find"
fi

echo "▸ Installing plugins..."
nvim --headless "+Lazy sync" +qall

echo "Done. Launch with 'nvim'"
