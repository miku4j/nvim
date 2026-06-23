return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = {
    options = {
      theme = "auto",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = { "neo-tree", "lazy" },
      globalstatus = true,
    },
    sections = {
      lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
      lualine_b = {
        { "branch", icon = "" },
        { "diff", symbols = { added = "+", modified = "~", removed = "-" } },
        { "diagnostics", symbols = { error = "E:", warn = "W:", info = "I:", hint = "H:" } },
      },
      lualine_c = {
        { "filename", path = 1, symbols = { modified = " ●", readonly = " ", unnamed = "" } },
      },
      lualine_x = {
        { "fileformat" },
        { "encoding" },
        { "filetype", icon_only = true },
      },
      lualine_y = {
        { "progress", separator = { right = "" }, left_padding = 2 },
      },
      lualine_z = {
        { "location" },
      },
    },
    extensions = { "fugitive" },
  },
}
