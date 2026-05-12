return {
  'stevearc/aerial.nvim',
  opts = {},
  cmd = 'Aerial',
  keys = {
    {
      '<leader>a',
      '<cmd>AerialToggle! right<cr>',
      desc = 'Toggle Aerial',
    },
    {
      '<leader>sa',
      '<cmd>Telescope aerial<cr>',
      desc = 'Search Aerial Symbols',
    },
  },
  -- Optional dependencies
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
}
