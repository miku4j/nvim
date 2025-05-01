require("nvchad.configs.lspconfig").defaults()

require "lsp.volar"

local servers = { "html", "cssls" }
vim.lsp.enable(servers)
