return {
  {
    "webhooked/kanso.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require('kanso').setup()
      vim.cmd.colorscheme('kanso-zen')
    end
  },
}
