require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- nvedit workspace: markdown raw <-> rendered toggle
map("n", "<leader>mt", "<cmd>RenderMarkdown toggle<CR>", { desc = "Toggle markdown render" })