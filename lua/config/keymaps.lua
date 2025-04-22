-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

if not vim.g.vscode then
  local map = LazyVim.safe_keymap_set

  -- Aider; mnemonic: Intelligent
  map("n", "<A-i>", function()
    Snacks.terminal.toggle("aider")
  end, { desc = "Open Aider Terminal" })
  map("t", "<A-i>", function()
    Snacks.terminal.toggle("aider")
  end, { desc = "Close Aider Terminal" })

  -- yazi; mnemonic: Organize
  map("n", "<A-o>", function()
    Snacks.terminal.toggle("yazi")
  end, { desc = "Open yazi Terminal" })
  map("t", "<A-o>", function()
    Snacks.terminal.toggle("yazi")
  end, { desc = "Close yazi Terminal" })

  -- Lazygit;
  map("n", "<A-g>", function()
    Snacks.terminal.toggle("lazygit")
  end, { desc = "Lazygit (Root Dir)" })
  map("t", "<A-g>", function()
    Snacks.terminal.toggle("lazygit")
  end, { desc = "Lazygit (Root Dir)" })

  -- nvim-ufo
  map("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
  map("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
end
