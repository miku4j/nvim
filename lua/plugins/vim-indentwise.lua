return {
  "jeetsukumaran/vim-indentwise",
  event = "VeryLazy",
  keys = {
    { "<A-h>", "<Plug>(IndentWisePreviousEqualIndent)", desc = "Go to previous equal indent", mode = { "n", "x" } },
    { "<A-l>", "<Plug>(IndentWiseNextEqualIndent)", desc = "Go to next equal indent", mode = { "n", "x" } },
  },
}
