# HANDOFF: nvedit

LIVE: https://github.com/f0x1en/nvedit (public)
TREE: ~/.config/nvim (NvChad v2.5 file-workspace + thin nvedit layer)

## What this is
Lean, installable NvChad v2.5 "file workspace" (nvim config + lazy.nvim bootstrap) with a small added layer for:
- render-markdown.nvim (markdown raw/render toggle)
- conform (format on save)
- lspconfig tweaks
No image backend/Kitty/Sixel.

## Keymaps (leader = Space)
- <C-n>  toggle nvim-tree
- <Space>e focus nvim-tree
- <Space>mt toggle markdown raw/rendered
- ;       command mode

## Installer (install.sh) - verified intent
One command (any Linux):
  curl -fsSL https://raw.githubusercontent.com/f0x1en/nvedit/main/install.sh | bash

What it does (inside):
1) Checks git + nvim (>= 0.10). Warns if rg/fd are missing.
2) Tries to install rg+fd via apt/dnf/pacman/brew (skips cleanly when non-interactive).
3) Deploys this repo to ~/.config/nvim (backs up existing config).
4) Launches nvim to bootstrap lazy.nvim + install plugins/tree-sitter parsers.

Important headless command (for follow-up testing):
  nvim '+Lazy sync'

## Problems / Challenges / Gotchas
1) Init/Lazy bootstrap crashes on fresh setups (E5112/E5113/E5113-family)
   - Root cause: init.lua had an invalid vim.fn.system() argument shape during lazy bootstrap.
   - Status: fixed on origin by ensuring the system() call uses the list-arg form.
   - Symptom to paste back: the exact E* line with the file:line.

2) Headless command name confusion
   - LazySync is NOT a valid command.
   - Use: '+Lazy sync'

3) Testing must be isolated
   - Never delete/overwrite your real ~/.config/nvim (main Hermes setup).
   - Use a temp HOME for curl|bash tests.

## Next possible steps (VM / clean machine testing)
1) On the VM you are installing on:
   - run: curl -fsSL .../install.sh | bash
   - then: nvim
   - if it errors: paste the exact E* block (file + line) and the log snippet.

2) From the isolated temp HOME (recommended):
   - verify init.lua loads (no E* crash)
   - verify lazy directory exists and plugins land under:
     $HOME/.local/share/nvim/lazy/

3) If rg/fd are missing:
   - confirm search UI still works (telescope will run, but ripgrep/fd improves speed).

4) If you want to extend features later:
   - add plugins only when they earn it (images are on hold).

## Ongoing Improvements (Automated)
- Proactively improve installer for automatic / deps.
- Add  for post-install validation.
- Continue monitoring repo for issues.
