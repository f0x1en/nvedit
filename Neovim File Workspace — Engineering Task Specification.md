# Neovim File Workspace — Spec (condensed)

Backing doc for the nvedit project. Full 1066-line version deleted; this is all the signal.

## Goal
Turn existing NvChad config into a small, cohesive file workspace. NOT a new app, no Obsidian clone. Use existing plugins + minimal Lua glue. Guiding rule: use existing tools first, customize only where they fall short, don't duplicate functionality an established plugin provides.

## Environment
Debian/KDE Plasma/Wayland/zsh, NvChad + nvim. chafa available. Obsidian opens the same .md files but is not the project's business.

## Decisions (made — don't re-litigate)
- Explorer: Oil (simple, portable)
- Markdown renderer: render-markdown.nvim
- Image viewing: chafa (standalone, float window). Do NOT use Kitty/ueberzug++/Sixel image.nvim backends.
- Search: picker (Telescope) + rg + fd
- Leader: `,` (space conflicts NvChad default)
- External fallback: `xdg-open` for everything Neovim can't handle

## Desired file-type behavior
```
Markdown → Neovim + rendered view (raw/rendered toggle)
text/code → Neovim normal editing (preserve NvChad experience)
image     → chafa
everything else → xdg-open
```

## Markdown requirements
- Must FEEL rendered, not just syntax-highlighted.
- Simple toggle between raw and rendered modes.
- Image links (`![d](img/x.png)`) recognized; real pixel rendering only if a mature compatible solution exists; otherwise a graceful way to inspect the linked image via chafa. Missing/broken images must never crash nvim — degrade to placeholder.
- `.md` files stay ordinary Markdown, Obsidian-compatible. No frontmatter auto-added.

## No image framework if not justified
Standalone images are separate (easy, chafa). Embedded rendered Markdown images are harder — try mature plugin first, small adapter second, otherwise STOP and report tradeoff rather than build a monster. Do not pull in a big image framework to satisfy one feature.

## Rules (hard constraints)
- No: Rust, Ratatui, custom TUI, custom file manager/markdown-parser/search-engine, database, attachment subsystem (`_att` dirs, image paste), Obsidian semantics (backlinks/graph/tags/daily notes/wiki links/block IDs), PDF/audio/video/image-paste features, more than one of snacks/oil/neo-tree/mini.files, multiple markdown renderers.
- Avoid plugin duplication: before adding a dep answer "is this already in NvChad/a plugin/Neovim?"; don't add competing pickers/explorers/renderers.
- Preserve NvChad structure, no full rewrite, incremental changes. Keep config modular (small files like `lua/plugins/workspace.lua`, `lua/config/keymaps.lua`) using lazy.nvim conventions.
- Prefer existing sane plugin mappings; add custom keymaps only for real usability problems.
- Don't hard-code a permanent pane layout; use normal nvim windows/plugin-native layout.
- Respect Unix composability: delegate non-handled files to xdg-open, don't build custom binary previewers.
- Workspace must stay useful remotely/under tmux/no terminal graphics (another reason chafa).
- Performance: lazy-load/debounce; don't render expensive previews on rapid cursor movement.

## Definition of done
- Filesystem: navigate dirs comfortably; create file/dir, rename, move, copy, delete.
- Search: filename + content search work.
- Editing: text/code open normally, NvChad behavior preserved.
- Markdown: renders visually, raw editing possible, stays ordinary .md, Obsidian-compatible, image links recognized + inspected/opened without breaking.
- Images: standalone viewed via chafa, clean return to nvim, missing/broken fail gracefully.
- Other files: unsupported → xdg-open.
- Engineering: no unnecessary architecture, no duplication, no destructive rewrite, config modular/readable, behavior tested.

## Process
Treat this spec as GOAL + CONSTRAINTS, not "install every named plugin." Sequence: audit machine → research current upstream docs (don't trust stale memory) → decide (one of each category) → implement minimally → test (see §done list incl. spaces-in-paths, unusual names, missing images, large files). Explain significant tradeoffs before large changes.

## Verification command
```
nvim --headless 'qa!'   # must start with no errors
```