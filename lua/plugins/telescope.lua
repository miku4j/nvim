return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
  },
  cmd = "Telescope",
  keys = {
    { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find Files" },
    { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Live Grep" },
    { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Find Buffers" },
    { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Help Tags" },
    { "<leader>fk", function() require("telescope.builtin").keymaps() end, desc = "Keymaps" },
    { "<leader>fd", function() require("telescope.builtin").diagnostics() end, desc = "Diagnostics" },
    { "<leader>fs", function() require("telescope.builtin").lsp_document_symbols() end, desc = "Symbols" },
    { "<leader>fR", function() require("telescope.builtin").resume() end, desc = "Resume" },
    { "<leader>f.", function() require("telescope.builtin").oldfiles() end, desc = "Recent Files" },
    { "<leader>fr", function() require("telescope.builtin").registers() end, desc = "Registers" },
    { "<leader>fC", function() require("telescope.builtin").commands() end, desc = "Commands" },
    { "<leader>fc", function() require("telescope.builtin").command_history() end, desc = "Command History" },
    { "<leader>fq", function() require("telescope.builtin").quickfix() end, desc = "Quickfix List" },
    { "<leader>fl", function() require("telescope.builtin").loclist() end, desc = "Location List" },
    { "gr", function() require("telescope.builtin").lsp_references() end, desc = "References" },
    { "gi", function() require("telescope.builtin").lsp_implementations() end, desc = "Implementations" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_solver = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
      },
    })

    pcall(telescope.load_extension, "fzf")
  end,
}
