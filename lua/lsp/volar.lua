vim.lsp.config("volar", {
  -- add filetypes for typescript, javascript and vue
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
  init_options = {
    vue = {
      -- disable hybrid mode
      hybridMode = false,
    },
  },
})
-- you must remove "ts_ls" config
-- vim.lsp.config['ts_ls'] = {}

vim.lsp.enable "volar"
