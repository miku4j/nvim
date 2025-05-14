local mappings = {
  -- LSP references
  {
    '<leader>lr',
    require('telescope.builtin').lsp_references,
    '[G]oto [R]eferences',
  },
  -- Rename
  {
    '<leader>lR',
    vim.lsp.buf.rename,
    'Rename (LSP)',
  },
  -- Implementations
  {
    '<leader>li',
    require('telescope.builtin').lsp_implementations,
    '[G]oto [I]mplementation',
  },
  -- Definitions
  {
    '<leader>ld',
    require('telescope.builtin').lsp_definitions,
    '[G]oto [D]efinitions',
  },
  -- Declaration
  {
    '<leader>lD',
    vim.lsp.buf.declaration,
    '[G]oto [D]eclaration',
  },
  -- Document symbols
  {
    '<leader>ls',
    require('telescope.builtin').lsp_document_symbols,
    'Open Document Symbols',
  },
  -- Workspace symbols
  {
    '<leader>lw',
    require('telescope.builtin').lsp_workspace_symbols,
    'Open Workspace Symbols',
  },
  -- Workspace symbols (dynamic)
  {
    '<leader>lW',
    require('telescope.builtin').lsp_dynamic_workspace_symbols,
    'Open Workspace Symbols',
  },
  -- Type definitions
  {
    '<leader>lt',
    require('telescope.builtin').lsp_type_definitions,
    '[G]oto [T]ype Definition',
  },
  -- Code actions
  {
    '<leader>la',
    vim.lsp.buf.code_action,
    'Code Actions',
  },
}

-- Loop through mappings to set keybindings
for _, map in ipairs(mappings) do
  local key = map[1]
  local func = map[2]
  local desc = map[3]
  vim.keymap.set('n', key, func, { desc = desc })
end
