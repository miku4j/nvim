return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        transparent_background = true,
      })

      -- vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
  {
    "webhooked/kanso.nvim",
    lazy = false,
    priority = 1001,
    config = function()
      require("kanso").setup({
        italics = false, -- enable italics
        transparent = true, -- do not set background color
      })

      vim.cmd("colorscheme kanso-zen")
    end,
  },
}
