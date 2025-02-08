return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = { width = 30 },
    },
  },
  {
    "Shatur/neovim-ayu",
    priority = 1000,
    config = function()
      require("ayu").setup({})
      require("ayu").colorscheme()
    end,
  },
}
