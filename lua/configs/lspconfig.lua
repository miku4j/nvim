require("nvchad.configs.lspconfig").defaults()

require "lsp.volar"

local servers = { "html", "cssls", "tailwindcss" }
vim.lsp.enable(servers)
