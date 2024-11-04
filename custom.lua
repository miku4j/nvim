return {
	{ "nvim-lualine/lualine.nvim", enabled = false },
	{ "echasnovski/mini.statusline", version = "*", opts = {} },
  { "jeetsukumaran/vim-indentwise" },
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
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.neobones = { transparent_background = true }
			vim.cmd.colorscheme("neobones")
		end,
	},
}
