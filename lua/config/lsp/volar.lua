vim.lsp.config('volar', {
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
  init_options = { vue = { hybridMode = false } },
})

vim.lsp.enable 'volar'
