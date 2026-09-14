# nvedit

NvChad v2.5 "file workspace" config. Minimal, installable, works headless on any
Linux with `nvim` + `git`.

**Stack:** oil, render-markdown, chafa preview, telescope, conform, lspconfig.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/f0x1en/nvedit/main/install.sh | bash
```

`install.sh` checks deps, syncs lazy.nvim plugins headless, never touches the
host outside `~/.config/nvim`.

## Keymaps (leader = Space)

| Key | Action |
| --- | ------ |
| `<C-n>` | Toggle nvim-tree |
| `<Space>e` | Focus nvim-tree |
| `<Space>mt` | Toggle markdown raw / rendered |
| `<Space>ff` | Telescope find files |
| `<Space>fw` | Telescope live grep |
| `<Space>fb` | Telescope buffers |

## Verify

```bash
nvim --headless "+Lazy check" +qall
```

or run the bundled smoke test:

```bash
bash test.sh
```

## License

MIT — see [LICENSE](LICENSE).
