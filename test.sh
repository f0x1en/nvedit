#!/usr/bin/env bash
set -euo pipefail

# nvedit smoke test validates headless nvim lazy.nvim
echo "▸ Testing nvim load..."
if nvim --headless +qall; then
  echo "✔ Nvim loads successfully."
else
  echo "✘ Nvim failed load."
  exit 1
fi

echo "▸ Testing lazy.nvim..."
if nvim --headless "+Lazy check" +qall; then
  echo "✔ Lazy.nvim check passed."
else
  echo "✘ Lazy.nvim check failed."
  exit 1
fi

echo "All tests passed."
