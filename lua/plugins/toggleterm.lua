return {
  "akinsho/toggleterm.nvim",
  version = "*",
  cmd = { "ToggleTerm", "TermExec" },
  keys = {
    { "<c-/>", function() require("toggleterm").toggle() end, desc = "Toggle Terminal", mode = { "n", "t" } },
    { "<c-_>", function() require("toggleterm").toggle() end, desc = "Toggle Terminal", mode = { "n", "t" } },
  },
  opts = {
    size = 20,
    open_mapping = false,
    direction = "float",
    float_opts = {
      border = "curved",
    },
  },
}
