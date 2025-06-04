return {
  {
    '<leader>p',
    function()
      require('persistence').load()
    end,
    desc = 'load session',
  },
}
