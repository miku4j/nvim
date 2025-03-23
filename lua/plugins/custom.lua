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
        overrides = {
          Normal = { bg = "None" },
          NormalFloat = { bg = "none" },
          ColorColumn = { bg = "None" },
          SignColumn = { bg = "None" },
          Folded = { bg = "None" },
          FoldColumn = { bg = "None" },
          CursorLine = { bg = "None" },
          CursorColumn = { bg = "None" },
          VertSplit = { bg = "None" },
        },
      })
      -- require("ayu").colorscheme()
    end,
  },
  {
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      tweak_background = {
        -- normal = 'none',
      }
    }
    -- init = function()
    --   vim.cmd.colorscheme("lackluster")
    --   vim.cmd.colorscheme("lackluster-hack") -- my favorite
    --   vim.cmd.colorscheme("lackluster-mint")
    -- end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "lackluster-hack",
      colorscheme = "ayu",
    },
  },
}
