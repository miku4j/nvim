return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  dependencies = {
    -- check the installation instructions at
    -- https://github.com/folke/snacks.nvim
    "folke/snacks.nvim",
  },
  keys = {
    {
      "<leader>yo",
      mode = { "n", "v" },
      "<cmd>Yazi<cr>",
      desc = "[O]pen yazi at the current file",
    },
    {
      "<leader>yr",
      "<cmd>Yazi toggle<cr>",
      desc = "[R]esume the last yazi session",
    },
    {
      "<leader>yc",
      "<cmd>Yazi cwd<cr>",
      desc = "Open yazi in [C]wd",
    },
  },
  opts = {
    -- if you want to open yazi instead of netrw, see below for more info
    open_for_directories = false,
    keymaps = {
      show_help = "<f1>",
    },
  },
}
