-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

-- Aider; mnemonic: Intelligent
map("n", "<A-i>", function()
  Snacks.terminal.toggle("aider --watch-files --chat-mode ask")
end, { desc = "Open Aider Terminal" })
map("t", "<A-i>", function()
  Snacks.terminal.toggle("aider --watch-files --chat-mode ask")
end, { desc = "Close Aider Terminal" })

-- LF; mnemonic: Organize
map("n", "<A-o>", function()
  Snacks.terminal.toggle("lf")
end, { desc = "Open LF Terminal" })
map("t", "<A-o>", function()
  Snacks.terminal.toggle("lf")
end, { desc = "Close LF Terminal" })

-- Lazygit;
map("n", "<A-g>", function()
  Snacks.terminal.toggle("lazygit")
end, { desc = "Lazygit (Root Dir)" })
map("t", "<A-g>", function()
  Snacks.terminal.toggle("lazygit")
end, { desc = "Lazygit (Root Dir)" })
