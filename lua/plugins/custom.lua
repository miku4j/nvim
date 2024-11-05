return {
	{ "nvim-lualine/lualine.nvim", enabled = false },
	{ "echasnovski/mini.statusline", version = "*", opts = {} },
  {
    "jeetsukumaran/vim-indentwise",
    event = "VeryLazy",
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      document_highlight = {
        enabled = false,
      },
    },
  },
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		opts = {},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"zenbones-theme/zenbones.nvim",
    enabled = false,
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.neobones = { transparent_background = true }
			-- vim.cmd.colorscheme("neobones")
		end,
	},
  {
    "olivercederborg/poimandres.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("poimandres").setup({
        disable_background = true,
        disable_float_background = true,
        disable_italics = true,
      })
      vim.cmd.colorscheme("poimandres")
    end,
  },
}
