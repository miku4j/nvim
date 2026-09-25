local M = {}

function M.root(buf)
	buf = buf or 0
	if vim.api.nvim_buf_get_name(buf) == "" then
		return vim.fn.getcwd()
	end
	local dir = vim.fs.dirname(vim.api.nvim_buf_get_name(buf))
	local found = vim.fs.find(
		{ ".git", "lua", "package.json", "go.mod", "Cargo.toml", "Makefile", "setup.py", "pyproject.toml" },
		{ upward = true, path = dir }
	)
	if #found > 0 then
		return vim.fs.dirname(found[1])
	end
	return vim.fn.getcwd()
end

function M.git_root()
	local root = vim.fn.system("git rev-parse --show-toplevel 2>/dev/null"):gsub("%s+", "")
	if root ~= "" then
		return root
	end
	return M.root()
end

function M.format(opts)
	opts = opts or {}
	require("conform").format(vim.tbl_extend("force", { async = false, lsp_fallback = true }, opts))
end

function M.bufdelete()
	vim.cmd("bdelete")
end

function M.bufdelete_other()
	local cur = vim.api.nvim_get_current_buf()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if buf ~= cur and vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
			vim.api.nvim_buf_delete(buf, { force = not vim.bo[buf].modified })
		end
	end
end

function M.bufdelete_invisible()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
			local wins = vim.fn.win_findbuf(buf)
			if #wins == 0 then
				vim.api.nvim_buf_delete(buf, { force = not vim.bo[buf].modified })
			end
		end
	end
end

function M.zoom()
	if vim.g.zoomed then
		vim.cmd("wincmd =")
		vim.g.zoomed = false
	else
		local win = vim.api.nvim_get_current_win()
		vim.api.nvim_win_set_width(win, 999)
		vim.api.nvim_win_set_height(win, 999)
		vim.g.zoomed = true
	end
end

function M.toggle_diagnostics()
	local enabled = vim.g.diagnostics_enabled
	if enabled == nil then
		enabled = vim.diagnostic.is_enabled()
		vim.g.diagnostics_enabled = enabled
	end
	vim.g.diagnostics_enabled = not vim.g.diagnostics_enabled
	vim.diagnostic.enable(vim.g.diagnostics_enabled)
end

local terms = {}

local function term(name, cmd, direction)
	if not terms[name] then
		local Terminal = require("toggleterm.terminal").Terminal
		terms[name] = Terminal:new({
			cmd = cmd,
			direction = direction,
			float_opts = { border = "curved" },
		})
	end
	return terms[name]
end

local persistence_group = vim.api.nvim_create_augroup("persistence_helpers", { clear = true })
vim.api.nvim_create_autocmd("User", {
	group = persistence_group,
	pattern = "PersistenceLoadPre",
	callback = function()
		for name, t in pairs(terms) do
			t:shutdown()
			terms[name] = nil
		end
	end,
})

function M.lazygit_toggle(cwd)
	term("lazygit", "lazygit", "float"):toggle(cwd)
end

function M.pi_toggle(cwd)
	term("pi", "pi", "tab"):toggle(cwd or M.git_root())
end

-- Send raw keystrokes into pi's running prompt without submitting it.
function M.pi_send(text)
	local t = term("pi", "pi", "tab")
	if not t:is_open() then
		t:open()
	end
	if not t.job_id then
		return
	end
	t:focus()
	vim.fn.chansend(t.job_id, text)
end

function M.pi_file()
	local path = vim.api.nvim_buf_get_name(0)
	if path == "" then
		return
	end
	M.pi_send("@" .. path .. " ")
end

function M.pi_selection()
	local start = vim.fn.getpos("v")
	local finish = vim.fn.getpos(".")
	local srow = math.min(start[2], finish[2])
	local erow = math.max(start[2], finish[2])
	if srow == 0 then
		return
	end
	local lines = vim.api.nvim_buf_get_lines(0, srow - 1, erow, false)
	local tmp = vim.fn.tempname() .. ".md"
	vim.fn.writefile(lines, tmp)
	M.pi_send("@" .. tmp .. " ")
end

function M.git_browse()
	local url = vim.fn.system("git remote get-url origin 2>/dev/null"):gsub("%s+", "")
	local file = vim.fn.expand("%")
	local line = vim.fn.line(".")
	local remote_url = url:gsub("git@", "https://"):gsub("%.git$", ""):gsub(":", "/")
	local browse_url = remote_url .. "/blob/main/" .. file .. "#L" .. line
	vim.fn.system({ "xdg-open", browse_url })
end

return M
