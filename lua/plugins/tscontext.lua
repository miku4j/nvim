return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = function()
      vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "none" })
      return {}
    end,
  },
}
