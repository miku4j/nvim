return {
  {
    'oxfist/night-owl.nvim',
    enabled = true,
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      require('night-owl').setup {
        transparent_background = true,
      }
      vim.cmd.colorscheme 'night-owl'
    end,
  },
  {
    'drewxs/ash.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      require('ash').setup {
        transparent = false,
      }
      vim.cmd.colorscheme 'ash'
    end,
  },

  {
    'projekt0n/github-nvim-theme',
    enabled = false,
    name = 'github-theme',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('github-theme').setup {
        options = {
          transparent = true,
        },
      }

      vim.cmd.colorscheme 'github_dark_default'
    end,
  },
  {
    'metalelf0/black-metal-theme-neovim',
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      require('black-metal').setup {
        transparent = true,
      }
      require('black-metal').load()
    end,
  },
}
