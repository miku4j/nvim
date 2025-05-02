require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local nomap = vim.keymap.del

nomap("n", "<A-h>") -- for vim-indentwise
nomap("n", "<leader>fm") -- for async conform

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
  require("conform").format { async = true }
end, { desc = "Async format buffer" })
