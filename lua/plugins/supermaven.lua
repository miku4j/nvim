return {
  {
    "supermaven-inc/supermaven-nvim",
    event = "VeryLazy",
    config = function()
      require("supermaven-nvim").setup {
        keymaps = {
          accept_suggestion = "<C-k>",
          accept_word = "<C-j>",
          clear_suggestion = "<C-]>",
        },
      }
    end,
  },
}
