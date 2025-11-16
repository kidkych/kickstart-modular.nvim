local window = function()
  return vim.api.nvim_win_get_number(0)
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    tabline = {
      lualine_a = {},
      lualine_b = {
        {
          'tabs',
          mode = 2,
          max_length = function()
            return vim.go.columns
          end,
        },
      },
      lualine_c = {},
      lualine_x = {},
      lualine_y = { 'branch', 'diff' },
      lualine_z = {},
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'diagnostics' },
      lualine_c = { 'filename' },
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
    inactive_sections = {
      lualine_a = { window },
      lualine_b = { 'diagnostics' },
      lualine_c = { 'filename' },
      lualine_x = {},
      lualine_y = {},
    },
  },
}
