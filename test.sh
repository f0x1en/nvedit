#!/usr/bin/env bash
set -euo pipefail

# nvedit test script - verify installation
echo "▸ Testing nvim load..."
nvim --headless +qall

if [ $? -eq 0 ]; then
  echo "✔ Nvim loads successfully."
else
  echo "✘ Nvim failed to load."
  exit 1
fi

echo "▸ Testing lazy.nvim..."
nvim --headless "+Lazy check" +qall

if [ $? -eq 0 ]; then
  echo "✔ Lazy.nvim check passed."
else
  echo "✘ Lazy.nvim check failed."
  exit 1
fi

echo "All tests passed."
