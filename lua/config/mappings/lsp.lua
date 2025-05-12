vim.keymap.set('n', '<leader>lr', require('telescope.builtin').lsp_references, { desc = '[G]oto [R]eferences' })

vim.keymap.set('n', '<leader>li', require('telescope.builtin').lsp_implementations, { desc = '[G]oto [I]mplementation' })

vim.keymap.set('n', '<leader>ld', require('telescope.builtin').lsp_definitions, { desc = '[G]oto [D]efinitions' })

vim.keymap.set('n', '<leader>lD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration' })

vim.keymap.set('n', '<leader>ls', require('telescope.builtin').lsp_document_symbols, { desc = 'Open Document Symbols' })

vim.keymap.set('n', '<leader>lw', require('telescope.builtin').lsp_workspace_symbols, { desc = 'Open Workspace Symbols' })

vim.keymap.set('n', '<leader>lW', require('telescope.builtin').lsp_dynamic_workspace_symbols, { desc = 'Open Workspace Symbols' })

vim.keymap.set('n', '<leader>lt', require('telescope.builtin').lsp_type_definitions, { desc = '[G]oto [T]ype Definition' })
