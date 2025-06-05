return {
  {
    "jeetsukumaran/vim-indentwise",
    event = "VeryLazy",
    config = function()
      local map = LazyVim.safe_keymap_set

      map({ "n", "x" }, "<A-h>", "<Plug>(IndentWisePreviousEqualIndent)")
      map({ "n", "x" }, "<A-l>", "<Plug>(IndentWiseNextEqualIndent)")
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },
  {
    "unblevable/quick-scope",
    event = "VeryLazy",
    config = function()
      vim.cmd([[
        highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
        highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
      ]])
    end,
  },
  {
    "folke/flash.nvim",
    opts = {
      modes = {
        char = { enabled = false },
      },
    },
  },
}
