-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

-- Aider; mnemonic: Intelligent
map("n", "<A-i>", function()
  Snacks.terminal.toggle("aider --watch-files")
end, { desc = "Open Aider Terminal" })
map("t", "<A-i>", function()
  Snacks.terminal.toggle("aider --watch-files")
end, { desc = "Close Aider Terminal" })

-- LF; mnemonic: Organize
map("n", "<A-o>", function()
  Snacks.terminal.toggle("lf")
end, { desc = "Open LF Terminal" })
map("t", "<A-o>", function()
  Snacks.terminal.toggle("lf")
end, { desc = "Close LF Terminal" })
