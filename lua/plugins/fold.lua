return {
  {
    "kevinhwang91/nvim-ufo",
    enabled = true,
    event = "VeryLazy",
    dependencies = { "kevinhwang91/promise-async" },
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
