return {
  -- disable annoying settings
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        signature = { auto_open = { enabled = false } },
      },
    },
  },
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        documentation = {
          auto_show = false,
        },
        ghost_text = {
          enabled = false,
        },
      },
    },
  },
  {
    "jeetsukumaran/vim-indentwise",
    vscode = true,
    event = "VeryLazy",
  },
  {
    "kylechui/nvim-surround",
    vscode = true,
    version = "*",
    event = "VeryLazy",
    opts = {},
  },
}
