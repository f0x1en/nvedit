# nvedit
Lean, installable NvChad v2.5 "file workspace" with added layer for:
- render-markdown.nvim (markdown raw/render toggle)
- conform (format on save)
- lspconfig tweaks

## Installation
```bash
curl -fsSL https://raw.githubusercontent.com/f0x1en/nvedit/main/install.sh | bash
```

## Keymaps (leader = Space)
- `<C-n>`: Toggle nvim-tree
- `<Space>e`: Focus nvim-tree
- `<Space>mt`: Toggle markdown raw/rendered
- `<Space>ff`: Telescope find files
- `<Space>fw`: Telescope live grep
- `<Space>fb`: Telescope buffers
- Command mode: `:`

## Verification
```bash
./test.sh
```
