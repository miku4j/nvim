return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>e", function() require("yazi").yazi() end, desc = "Yazi (cwd)" },
    { "<leader>fe", function() require("yazi").yazi(nil, vim.fn.expand("%:p:h")) end, desc = "Yazi (file dir)" },
  },
  opts = {
    open_for_directories = false,
    keymaps = {
      show_help = "<f1>",
    },
  },
}
