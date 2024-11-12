return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        blade = { "blade-formatter" },
        php = { "php_cs_fixer" },
      },
    },
  },
  {
    "jeetsukumaran/vim-indentwise",
    event = "VeryLazy",
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      document_highlight = {
        enabled = false,
      },
      servers = {
        phpactor = { filetypes = { "php", "blade" } },
        emmet_language_server = { filetypes = { "php", "blade" } },
      },
    },
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "zenbones-theme/zenbones.nvim",
    enabled = false,
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.neobones = { transparent_background = true }
      -- vim.cmd.colorscheme("neobones")
    end,
  },
  {
    "olivercederborg/poimandres.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("poimandres").setup({
        disable_background = true,
        disable_float_background = true,
        disable_italics = true,
      })
      vim.cmd.colorscheme("poimandres")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
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
