vim.loader.enable()

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.cmd [[let g:loaded_python3_provider = 0]]

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.hlsearch = false
vim.wo.wrap = false
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.mouse = 'a'
vim.g.clipboard = { -- blazing fast clipboard in wsl2
    name = "win32yank.exe",
    copy = {
        ["+"] = "win32yank.exe -i",
        ["*"] = "win32yank.exe -i",
    },
    paste = {
        ["+"] = "win32yank.exe -o --lf",
        ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 1,
}
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect'
vim.o.termguicolors = true
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set({ 'n', 'v' }, ';', ':')
vim.keymap.set('n', '<leader>w', function() vim.cmd [[w]] end, {})
vim.keymap.set('n', '<leader>q', function() vim.cmd [[q]] end, {})
vim.keymap.set('n', '<leader>x', function() vim.cmd [[q!]] end, {})

vim.keymap.set({ 'n', 'v' }, 'm', '<C-d>', {})
vim.keymap.set({ 'n', 'v' }, ',', '<C-u>', {})

require 'lazy'.setup({
    {
        'nvim-treesitter/nvim-treesitter',
        event = 'VeryLazy',
        config = function()
            require 'nvim-treesitter.configs'.setup {
                highlight = { enable = true },
                disable = function(_, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end
            }
        end
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        event = 'VeryLazy',
        config = function()
            vim.opt.list = true
            vim.opt.listchars:append 'space:⋅'
            vim.opt.listchars:append 'eol:↴'

            require('indent_blankline').setup {
                space_char_blankline = ' ',
                show_current_context = true,
                show_current_context_start = true,
            }
        end
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        event = 'VeryLazy',
        opts = {}
    },
    {
        'Shatur/neovim-ayu',
        lazy = false,
        config = function()
            local colors = require('ayu.colors')
            colors.generate(true)

            require('ayu').setup({
                mirage = true,
                overrides = {
                    Normal = { bg = 'None' },
                    ColorColumn = { bg = 'None' },
                    SignColumn = { bg = 'None' },
                    Folded = { bg = 'None' },
                    FoldColumn = { bg = 'None' },
                    CursorLine = { bg = 'None' },
                    CursorColumn = { bg = 'None' },
                    WhichKeyFloat = { bg = 'None' },
                    VertSplit = { bg = 'None' },
                    -- LineNr = { fg = colors.fg }
                },
            })
            vim.cmd([[colorscheme ayu]])
        end
    },
    {
        'NMAC427/guess-indent.nvim',
        event = 'VeryLazy'
    },
    {
        'nvim-telescope/telescope.nvim',
        event = 'VeryLazy',
        tag = '0.1.3',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')
            require('telescope').load_extension('projects')
            vim.keymap.set('n', '<leader>ii', builtin.builtin, {})
            vim.keymap.set('n', '<leader>if', builtin.find_files, {})
            vim.keymap.set('n', '<leader>ig', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>ib', builtin.buffers, {})
            vim.keymap.set('n', '<leader>ih', builtin.help_tags, {})
            vim.keymap.set('n', '<leader>io', builtin.oldfiles, {})
            vim.keymap.set('n', '<leader>ic', builtin.command_history, {})
            vim.keymap.set('n', '<leader>it', builtin.treesitter, {})
            vim.keymap.set('n', '<leader>id', builtin.diagnostics, {})
            vim.keymap.set('n', '<leader>ip', function() require 'telescope'.extensions.projects.projects {} end, {})
        end
    },
    {
        'junnplus/lsp-setup.nvim',
        dependencies = {
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',           -- optional
            'williamboman/mason-lspconfig.nvim', -- optional
        },
        opts = {
            default_mappings = true,
            mappings = {
                ['<leader><leader>f'] = vim.lsp.buf.format
            },
            on_attach = function()
                require('lsp-setup.utils').format_on_save(nil)
            end,
            servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            hint = {
                                enable = false,
                                arrayIndex = "Auto",
                                await = true,
                                paramName = "All",
                                paramType = true,
                                semicolon = "SameLine",
                                setType = false,
                            },
                            diagnostics = {
                                globals = {
                                    'vim',
                                    'require'
                                },
                            },
                            workspace = {
                                library = vim.api.nvim_get_runtime_file("", true),
                                checkThirdParty = false
                            },
                            telemetry = { enable = false },
                        },
                    },
                },
                pyright = {}
            }
        }
    },
    {
        "smoka7/hop.nvim",
        event = 'VeryLazy',
        version = "*",
        config = function()
            -- place this in one of your configuration file(s)
            local hop = require('hop')
            local directions = require('hop.hint').HintDirection
            hop.setup {}
            vim.keymap.set('', 's', function() vim.cmd([[HopChar1AC]]) end)
            vim.keymap.set('', 'S', function() vim.cmd([[HopChar1BC]]) end)
        end
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = 'VeryLazy',
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        -- opts = {} -- this is equalent to setup({}) function
        config = function()
            local remap = vim.api.nvim_set_keymap
            local npairs = require('nvim-autopairs')

            npairs.setup({ map_bs = false, map_cr = false })
            _G.MUtils = {}
            MUtils.CR = function()
                if vim.fn.pumvisible() ~= 0 then
                    if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
                        return npairs.esc('<c-y>')
                    else
                        return npairs.esc('<c-e>') .. npairs.autopairs_cr()
                    end
                else
                    return npairs.autopairs_cr()
                end
            end
            remap('i', '<cr>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })

            MUtils.BS = function()
                if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
                    return npairs.esc('<c-e>') .. npairs.autopairs_bs()
                else
                    return npairs.autopairs_bs()
                end
            end
            remap('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })
        end
    },
    {
        'hrsh7th/nvim-cmp',
        event = 'VeryLazy',
        dependencies = {
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        },
        config = function()
            local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and
                    vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            local luasnip = require("luasnip")
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                            -- they way you will only jump inside the snippet region
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'path' }
                }, {
                    { name = 'buffer' },
                })
            })
        end
    },
    {
        'milanglacier/yarepl.nvim',
        dependencies = {
            {
                'nvim-telescope/telescope-ui-select.nvim',
                opts = {},
                config = function()
                    require 'telescope'.load_extension 'ui-select'
                end
            }
        },
        ft = 'python',
        config = function()
            require 'yarepl'.setup {
                wincmd = 'vertical botright 55 split'
            }
            -- The `run_cmd_with_count` function enables a user to execute a command with
            -- count values in keymaps. This is particularly useful for `yarepl.nvim`,
            -- which heavily uses count values as the identifier for REPL IDs.
            local function run_cmd_with_count(cmd)
                return function()
                    vim.cmd(string.format('%d%s', vim.v.count, cmd))
                end
            end

            -- The `partial_cmd_with_count_expr` function enables users to enter partially
            -- complete commands with a count value, and specify where the cursor should be
            -- placed. This function is mainly designed to bind `REPLExec` command into a
            -- keymap.
            local function partial_cmd_with_count_expr(cmd)
                return function()
                    -- <C-U> is equivalent to \21, we want to clear the range before next input
                    -- to ensure the count is recognized correctly.
                    return ':\21' .. vim.v.count .. cmd
                end
            end

            local ft_to_repl = {
                r = 'radian',
                rmd = 'radian',
                quarto = 'radian',
                markdown = 'radian',
                ['markdown.pandoc'] = 'radian',
                python = 'ipython',
                sh = 'bash',
                REPL = '',
            }

            local repl = ft_to_repl[vim.bo.filetype]
            if repl then
                vim.keymap.set('n', '<leader>rs', run_cmd_with_count('REPLStart ' .. repl), {})
            end
            vim.keymap.set('n', '<leader>rf', run_cmd_with_count 'REPLFocus', {})
            vim.keymap.set('n', '<leader>rv', '<CMD>Telescope REPLShow<CR>', {})
            vim.keymap.set('n', '<leader>rh', run_cmd_with_count 'REPLHide', {})
            vim.keymap.set('v', '<leader>s', run_cmd_with_count 'REPLSendVisual', {})
            vim.keymap.set('n', '<leader>ss', run_cmd_with_count 'REPLSendLine', {})
            vim.keymap.set('n', '<leader>s', run_cmd_with_count 'REPLSendMotion', {})
            vim.keymap.set('n', '<leader>rq', run_cmd_with_count 'REPLClose', {})
            vim.keymap.set('n', '<leader>rc', '<CMD>REPLCleanup<CR>', {})
            vim.keymap.set('n', '<leader>rS', '<CMD>REPLSwap<CR>', {})
            vim.keymap.set('n', '<leader>r?', run_cmd_with_count 'REPLStart', {})
            vim.keymap.set('n', '<leader>ra', '<CMD>REPLAttachBufferToREPL<CR>', {})
            vim.keymap.set('n', '<leader>rd', '<CMD>REPLDetachBufferToREPL<CR>', {})
            vim.keymap.set('n', '<leader>re', partial_cmd_with_count_expr 'REPLExec', {})
        end
    },
    {
        "folke/which-key.nvim",
        event = 'VeryLazy',
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    },
    {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        event = 'VeryLazy',
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            vim.keymap.set('n', '<leader>gg', function()
                vim.cmd [[LazyGit]]
            end)
        end
    },
    {
        'nvim-tree/nvim-tree.lua',
        event = 'VeryLazy',
        opts = {}
    },
    {
        "max397574/better-escape.nvim",
        config = function()
            require("better_escape").setup({
                mapping = { 'jk', 'kj' }
            })
        end,
    },
    {
        'mrjones2014/smart-splits.nvim',
        config = function()
            -- recommended mappings
            -- resizing splits
            -- these keymaps will also accept a range,
            -- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
            vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
            vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
            vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
            vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)
            -- moving between splits
            vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
            vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
            vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
            vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
            -- swapping buffers between windows
            vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
            vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
            vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
            vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)
        end
    },
    {
        "ahmedkhalf/project.nvim",
        event = 'VeryLazy',
        config = function()
            require("project_nvim").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    },
}, {
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            }
        }
    }
})
