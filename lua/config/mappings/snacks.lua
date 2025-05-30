return {
  {
    '<leader>g',
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
      Snacks.terminal 'aider'
    end,
    desc = 'Terminal',
    mode = { 'n', 't' },
  },
  {
    '<leader>sp',
    function()
      Snacks.picker.projects()
    end,
    desc = 'Projects',
  },
  {
    '<leader>bd',
    function()
      Snacks.bufdelete()
    end,
    desc = 'Buffer delete',
  },
  {
    '<leader>bo',
    function()
      Snacks.bufdelete.other()
    end,
    desc = 'Buffer delete other',
  },
}
