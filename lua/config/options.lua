-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim option
vim.o.cursorcolumn = true

-- lazyvim option
vim.g.autoformat = false
vim.g.snacks_animate = false
vim.o.smoothscroll = false

-- temporary fix for treesitter flickering on multiple window
-- see https://github.com/neovim/neovim/issues/32660
vim.g._ts_force_sync_parsing = true

-- line wrap
vim.o.wrap = true
vim.o.breakindent = true
vim.o.showbreak = string.rep(" ", 3) -- Make it so that long lines wrap smartly
vim.o.linebreak = true
