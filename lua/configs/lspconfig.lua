require("nvchad.configs.lspconfig").defaults()

require "lsp.volar"

local servers = { "html", "cssls", "tailwindcss", "eslint" }
vim.lsp.enable(servers)
