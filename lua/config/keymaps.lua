-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- previous hunk
vim.keymap.del("n", "<A-k>")
vim.keymap.set("n", "<A-k>", function()
  require("gitsigns").nav_hunk("prev")
end, { desc = "Go to previous hunk" })

-- next hunk
vim.keymap.del("n", "<A-j>")
vim.keymap.set("n", "<A-j>", function()
  require("gitsigns").nav_hunk("next")
end, { desc = "Go to next hunk" })

-- copy current buffer
vim.keymap.set("n", "<leader>bc", "ggyG''", { desc = "Copy current buffer" })
