return {
  {
    "stevearc/conform.nvim",
    event = "VeryLazy",
    opts = {
      formatters_by_ft = {
        blade = { "blade-formatter" },
        php = { "php_cs_fixer" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    opts = {
      document_highlight = {
        -- enabled = false,
      },
      servers = {
        phpactor = { filetypes = { "php", "blade" } },
        emmet_language_server = { filetypes = { "php", "blade" } },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    config = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        opts.ensure_installed = LazyVim.dedup(opts.ensure_installed)
      end
      require("nvim-treesitter.configs").setup(opts)
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "blade",
      }
      vim.cmd([[
      augroup BladeFiltypeRelated
      au BufNewFile,BufRead *.blade.php set ft=blade
      augroup END
    ]])
    end,
  },
}
