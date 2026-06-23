return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "VeryLazy",
  keys = {
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
  },
  opts = {
    options = {
      mode = "buffers",
      numbers = "none",
      close_command = function(bufnum)
        require("core.helpers").bufdelete()
      end,
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level, dict, context)
        local s = ""
        for e, n in pairs(dict) do
          if e == "error" then
            s = s .. "E:" .. n .. " "
          elseif e == "warning" then
            s = s .. "W:" .. n .. " "
          end
        end
        return s
      end,
      offsets = {
        {
          filetype = "NvimTree",
          text = "Explorer",
          highlight = "Directory",
          text_align = "left",
        },
      },
      indicator = {
        icon = "▎",
        style = "icon",
      },
      buffer_close_icon = "",
      modified_icon = "●",
      separator_style = "thin",
      always_show_bufferline = true,
      sort_by = "insert_at_end",
    },
  },
}
