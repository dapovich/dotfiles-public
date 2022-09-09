local status, lualine = pcall(require, "lualine")
if (not status) then return end

-- Customize theme colors
local custom_auto = require'lualine.themes.auto'
custom_auto.normal.c.fg = '#282828'
custom_auto.insert.c.fg = '#282828'
custom_auto.visual.c.fg = '#282828'
custom_auto.replace.c.fg = '#282828'
custom_auto.command.c.fg = '#282828'
custom_auto.inactive.c.fg = '#282828'

lualine.setup {
  options = {
    icons_enabled = true,
    theme = custom_auto,
    section_separators = {left = '', right = ''},
    component_separators = {left = '|', right = '|'},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { right = ''} },
    },
    lualine_b = {
      { 'branch', separator = { right = '▓▒░'} },
    },
    lualine_c = {{
      'filename',
      file_status = true, -- Displays file status (readonly status, modified status)
      path = 0 -- 0 = Just filename, 1 = relative path, 2 = absolute path
    }},
    lualine_x = {
      { 'diagnostics', sources = {"nvim_diagnostic"}, symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '} },
      'encoding',
      'filetype'
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
    }},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'fugitive'}
}
