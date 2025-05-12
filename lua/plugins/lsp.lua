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
    lazy = false,
    dependencies = {
      'neovim/nvim-lspconfig',
      'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function()
      require('mason').setup {}

      require('mason-tool-installer').setup {
        ensure_installed = {
          -- { 'golangci-lint', version = 'v1.47.0' },
          -- { 'bash-language-server', auto_update = true },
          -- {
          --   'gopls',
          --   condition = function()
          --     return not os.execute 'go version'
          --   end,
          -- },
          'lua-language-server',
          'stylua',
          'shfmt',
          'vue-language-server', -- includes ts_ls
          'eslint_d'
        },
      }

      require 'config.lsp.lua_ls'
      require 'config.lsp.volar'

      vim.lsp.enable 'eslint_d'
    end,
  },
}
