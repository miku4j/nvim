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

-- fix <C-i> not jumping
nomap("n", "<TAB>")
nomap("n", "<S-TAB>")
map("n", "H", ":bprev<CR>", { desc = "Prev buffer" }) -- don't need H and L coz of flash.nvim
map("n", "L", ":bnext<CR>", { desc = "Next buffer" })
