return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "<A-h>", function() require("gitsigns").prev_hunk() end, desc = "Prev Hunk", mode = "n" },
    { "<A-l>", function() require("gitsigns").next_hunk() end, desc = "Next Hunk", mode = "n" },
    { "<leader>hs", function() require("gitsigns").stage_hunk() end, desc = "Stage Hunk", mode = { "n", "v" } },
    { "<leader>hr", function() require("gitsigns").reset_hunk() end, desc = "Reset Hunk", mode = { "n", "v" } },
    { "<leader>hp", function() require("gitsigns").preview_hunk() end, desc = "Preview Hunk" },
    { "<leader>hb", function() require("gitsigns").blame_line() end, desc = "Blame Line" },
    { "<leader>hd", function() require("gitsigns").diffthis() end, desc = "Diff This" },
    { "<leader>hS", function() require("gitsigns").stage_buffer() end, desc = "Stage Buffer" },
    { "<leader>hU", function() require("gitsigns").undo_stage_hunk() end, desc = "Undo Stage Hunk" },
  },
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol",
      delay = 1000,
    },
  },
}
