return {
  {
    '<leader>hl',
    function()
      Snacks.lazygit()
    end,
    desc = 'Lazygit',
  },
  {
    '<A-t>',
    function()
      Snacks.terminal()
    end,
    desc = 'Terminal',
    mode = { 'n', 't' },
  },
  {
    '<A-i>',
    function()
      Snacks.terminal('aider')
    end,
    desc = 'Terminal',
    mode = { 'n', 't' },
  },
}
