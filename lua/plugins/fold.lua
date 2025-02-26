return {
  {
    "kevinhwang91/nvim-ufo",
    event = "VeryLazy",
    dependencies = { "kevinhwang91/promise-async", { "chrisgrieser/nvim-origami", opts = {} } },
    config = function()
      --- https://github.com/kevinhwang91/nvim-ufo
      require("ufo").setup({
        provider_selector = function()
          return { "treesitter", "indent" }
        end,
      })
    end,
  },
}
