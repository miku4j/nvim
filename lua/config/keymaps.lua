-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

-- Aider; mnemonic: Intelligent
map("n", "<M-i>", function()
  Snacks.terminal.toggle("aider --watch-files")
end, { desc = "Open Aider Terminal" })
map("t", "<M-i>", function()
  Snacks.terminal.toggle("aider --watch-files")
end, { desc = "Close Aider Terminal" })
