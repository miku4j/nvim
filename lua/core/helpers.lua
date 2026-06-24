local M = {}

function M.root(buf)
  buf = buf or 0
  if vim.api.nvim_buf_get_name(buf) == "" then
    return vim.fn.getcwd()
  end
  local dir = vim.fs.dirname(vim.api.nvim_buf_get_name(buf))
  local found = vim.fs.find({ ".git", "lua", "package.json", "go.mod", "Cargo.toml", "Makefile", "setup.py", "pyproject.toml" }, { upward = true, path = dir })
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

local lazygit_term

local persistence_group = vim.api.nvim_create_augroup("persistence_helpers", { clear = true })
vim.api.nvim_create_autocmd("User", {
  group = persistence_group,
  pattern = "PersistenceLoadPre",
  callback = function()
    if lazygit_term then
      lazygit_term:shutdown()
      lazygit_term = nil
    end
  end,
})

function M.lazygit_toggle(cwd)
  if not lazygit_term then
    local Terminal = require("toggleterm.terminal").Terminal
    lazygit_term = Terminal:new({
      cmd = "lazygit",
      direction = "float",
      float_opts = { border = "curved" },
    })
  end
  lazygit_term:toggle(cwd)
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
