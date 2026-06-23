return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    spec = {
      { "<leader>b", group = "Buffer" },
      { "<leader>c", group = "Code" },
      { "<leader>f", group = "Find" },
      { "<leader>g", group = "Git" },
      { "<leader>s", group = "Search" },
      { "<leader>u", group = "UI/Utils" },
      { "<leader>w", group = "Window" },
      { "<leader>x", group = "Quickfix/Location" },
      { "<leader>t", group = "Tab" },
      { "[", group = "prev" },
      { "]", group = "next" },
    },
  },
}
