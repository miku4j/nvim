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
      require("ayu").setup({
        -- overrides = {
        --   Normal = { bg = "None" },
        --   NormalFloat = { bg = "none" },
        --   ColorColumn = { bg = "None" },
        --   SignColumn = { bg = "None" },
        --   Folded = { bg = "None" },
        --   FoldColumn = { bg = "None" },
        --   CursorLine = { bg = "None" },
        --   CursorColumn = { bg = "None" },
        --   VertSplit = { bg = "None" },
        -- },
      })
      require("ayu").colorscheme()
    end,
  },
}
