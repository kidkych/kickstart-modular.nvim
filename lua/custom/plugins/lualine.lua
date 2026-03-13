local window = function()
  return vim.api.nvim_win_get_number(0)
end

local function sidekick_status_component()
  return {
    function()
      return ' '
    end,
    color = function()
      local status = require('sidekick.status').get()
      if status then
        return status.kind == 'Error' and 'DiagnosticError' or status.busy and 'DiagnosticWarn' or 'Special'
      end
    end,
    cond = function()
      return require('sidekick.status').get() ~= nil
    end,
  }
end

local function sidekick_cli_component()
  return {
    function()
      local status = require('sidekick.status').cli()
      return ' ' .. (#status > 1 and #status or '')
    end,
    cond = function()
      return #require('sidekick.status').cli() > 0
    end,
    color = function()
      return 'Special'
    end,
  }
end

return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        disabled_filetypes = {
          statusline = { 'neo-tree' },
          winbar = { 'neo-tree' },
        },
      },
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
        lualine_c = {
          'filename',
          sidekick_status_component(),
          sidekick_cli_component(),
        },
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
  },
}
