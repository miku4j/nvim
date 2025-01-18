return {
  {
    "oxfist/night-owl.nvim",
    enabled = true,
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1001, -- make sure to load this before all the other start plugins
    opts = {
      transparent_background = true,
    },
  },
  {
    "folke/tokyonight.nvim",
    enabled = true,
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "night-owl",
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = { width = 30 },
    },
  },
}
