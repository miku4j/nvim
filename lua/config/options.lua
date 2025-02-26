-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.autoformat = false
vim.g.snacks_animate = false
vim.o.ignorecase = false
vim.o.smartcase = false
vim.o.wrap = true
vim.o.breakindent = true
vim.o.showbreak = string.rep(" ", 3) -- Make it so that long lines wrap smartly
vim.o.linebreak = true
