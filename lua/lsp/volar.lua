vim.lsp.config("volar", {
  -- add filetypes for typescript, javascript and vue
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
  init_options = {
    vue = {
      -- disable hybrid mode
      hybridMode = false,
    },
    typescript = {
      tsdk = vim.fn.expand "~/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib/",
    },
  },
})
-- you must remove "ts_ls" config
-- vim.lsp.config['ts_ls'] = {}

vim.lsp.enable "volar"
