return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = { width = 30 },
    },
  },
  {
    "oxfist/night-owl.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      require("night-owl").setup({
        transparent_background = true,
      })
      vim.cmd.colorscheme("night-owl")
    end,
  },
  -- {
  --   "Shatur/neovim-ayu",
  --   priority = 1000,
  --   config = function()
  --     require("ayu").setup({
  --       overrides = {
  --         Normal = { bg = "None" },
  --         NormalFloat = { bg = "none" },
  --         ColorColumn = { bg = "None" },
  --         SignColumn = { bg = "None" },
  --         Folded = { bg = "None" },
  --         FoldColumn = { bg = "None" },
  --         CursorLine = { bg = "None" },
  --         CursorColumn = { bg = "None" },
  --         VertSplit = { bg = "None" },
  --       },
  --     })
  --   end,
  -- },
  -- {
  --   "slugbyte/lackluster.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     tweak_background = {
  --       -- normal = 'none',
  --     },
  --   },
  -- },
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  --   opts = {
  --     transparent_background = true,
  --   }
  -- },
}
