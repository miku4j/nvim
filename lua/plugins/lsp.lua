return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			-- Opt-in: nothing auto-installs at startup. Install manually via
			-- `:Mason` or `:MasonInstall <server>` (e.g. `:MasonInstall gopls`).
			ensure_installed = {},
			automatic_installation = false,
			handlers = {
				["eslint"] = function()
					local capabilities = vim.lsp.protocol.make_client_capabilities()
					local ok_cmp, cmp = pcall(require, "cmp_nvim_lsp")
					if ok_cmp and cmp then
						capabilities = vim.tbl_deep_extend("force", capabilities, cmp.default_capabilities())
					end
					capabilities.documentFormattingProvider = false
					local ok_lsp, lspconfig = pcall(require, "lspconfig")
					if ok_lsp and lspconfig.eslint then
						pcall(lspconfig.eslint.setup, {
							capabilities = capabilities,
							filetypes = {
								"javascript",
								"javascriptreact",
								"typescript",
								"typescriptreact",
								"vue",
								"svelte",
								"astro",
							},
							settings = {
								format = false,
							},
						})
					end
				end,
				function(server_name)
					local capabilities = vim.lsp.protocol.make_client_capabilities()
					local ok_cmp, cmp = pcall(require, "cmp_nvim_lsp")
					if ok_cmp and cmp then
						capabilities = vim.tbl_deep_extend("force", capabilities, cmp.default_capabilities())
					end
					local ok_lsp, lspconfig = pcall(require, "lspconfig")
					if ok_lsp and lspconfig[server_name] then
						pcall(lspconfig[server_name].setup, {
							capabilities = capabilities,
						})
					end
				end,
			},
		},
		config = function(_, opts)
			local ok, err = pcall(function()
				require("mason-lspconfig").setup(opts)
			end)
			if not ok then
				vim.schedule(function()
					vim.notify("mason-lspconfig: " .. tostring(err), vim.log.levels.WARN)
				end)
			end
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp_attach", { clear = true }),
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if not client then
						return
					end
					local bufnr = args.buf
					local bufopts = { noremap = true, silent = true, buffer = bufnr }
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
					vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
					vim.keymap.set("n", "<leader>cf", function()
						require("core.helpers").format()
					end, bufopts)
					if client.server_capabilities.documentHighlightProvider then
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = bufnr,
							callback = vim.lsp.buf.document_highlight,
						})
						vim.api.nvim_create_autocmd("CursorMoved", {
							buffer = bufnr,
							callback = vim.lsp.buf.clear_references,
						})
					end
				end,
			})
		end,
	},
}
