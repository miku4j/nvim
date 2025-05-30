vim.lsp.config('ts_ls', {
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = '/home/miku4j/.local/share/fnm/node-versions/v22.15.0/installation/lib/node_modules/@vue/typescript-plugin',
        languages = { 'javascript', 'typescript', 'vue' },
      },
    },
  },
  filetypes = {
    'javascript',
    'typescript',
    'vue',
  },
})

vim.lsp.enable 'ts_ls'
vim.lsp.enable 'vue_ls'
