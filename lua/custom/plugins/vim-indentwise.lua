return {
  'jeetsukumaran/vim-indentwise',
  event = 'VeryLazy',
  keys = {
    {
      '<A-h>',
      mode = { 'n', 'v' },
      '<Plug>(IndentWisePreviousEqualIndent)',
      desc = 'Jump to previous equal indent',
    },
    {
      '<A-l>',
      mode = { 'n', 'v' },
      '<Plug>(IndentWiseNextEqualIndent)',
      desc = 'Jump to next equal indent',
    },
  },
}
