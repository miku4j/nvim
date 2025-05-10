return {
  {
    '<leader>e',
    function()
      require('persistence').load()
    end,
    desc = 'load session',
  },
}
