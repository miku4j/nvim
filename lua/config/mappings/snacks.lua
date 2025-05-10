return {
  {
    '<leader>l',
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
}
