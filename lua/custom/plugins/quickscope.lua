return {
  'unblevable/quick-scope',
  event = 'VeryLazy',
  config = function()
    vim.cmd [[
        highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
        highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
      ]]
  end,
}
