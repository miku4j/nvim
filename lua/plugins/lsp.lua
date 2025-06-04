return {
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    event = 'VeryLazy',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    'https://github.com/mason-org/mason.nvim',
    event = 'VeryLazy',
    dependencies = {
      'neovim/nvim-lspconfig',
    },
    config = function()
      require('mason').setup {}

      -- lua
      require 'config.lsp.lua_ls'

      -- web
      vim.lsp.enable 'cssls'
      vim.lsp.enable 'tailwindcss'
      vim.lsp.enable 'emmet_language_server'
      require 'config.lsp.vue_ls'

      -- python
      vim.lsp.enable 'ruff'
      vim.lsp.enable 'basedpyright'
    end,
  },
}
