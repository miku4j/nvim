return {
  -- disable annoying settings
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        signature = { auto_open = { enabled = false } },
      },
    },
  },
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        documentation = {
          auto_show = false,
        },
        ghost_text = {
          enabled = false,
        },
      },
    },
  },

  -- crazy qol plugins
  {
    "jeetsukumaran/vim-indentwise",
    vscode = true,
    event = "VeryLazy",
    config = function()
      local map = LazyVim.safe_keymap_set

      map({ "n", "x" }, "<A-h>", "<Plug>(IndentWisePreviousEqualIndent)")
      map({ "n", "x" }, "<A-l>", "<Plug>(IndentWiseNextEqualIndent)")
    end,
  },
  {
    "kylechui/nvim-surround",
    vscode = true,
    version = "*",
    event = "VeryLazy",
    opts = {},
  },
  {
    "unblevable/quick-scope",
    event = "VeryLazy",
    config = function()
      vim.cmd([[
        highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
        highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
      ]])
    end,
  },

  -- remap git signs
  {
    "lewis6991/gitsigns.nvim",
    event = "LazyFile",
    opts = {
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        -- stylua: ignore start
        map("n", "<A-j>", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gs.nav_hunk("next")
          end
        end, "Next Hunk")
        map("n", "<A-k>", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gs.nav_hunk("prev")
          end
        end, "Prev Hunk")
        map("n", "]H", function() gs.nav_hunk("last") end, "Last Hunk")
        map("n", "[H", function() gs.nav_hunk("first") end, "First Hunk")
        map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>ghp", gs.preview_hunk_inline, "Preview Hunk Inline")
        map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>ghB", function() gs.blame() end, "Blame Buffer")
        map("n", "<leader>ghd", gs.diffthis, "Diff This")
        map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end,
    },
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      modes = {
        char = { enabled = false }
      }
    },
  },
}
