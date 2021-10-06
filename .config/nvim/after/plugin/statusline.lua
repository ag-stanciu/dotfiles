local ok, lualine = pcall(require, 'lualine')
if not ok then
  return
end
local u = require('utils')

-- Lualine
lualine.setup({
  options = {
    icons_enabled = true,
    theme = 'onedark',
    section_separators = {
      left = '',
      right = ''
    },
    component_separators = {
      left = '',
      right = ''
    },
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = { u.filepath },
    lualine_x = {
      { u.lua_lsp_progress, color = { fg = '#fff' } },
      { "diagnostics", sources = { "nvim_lsp" }, symbols = {error=" " , warn=" ", info=" ", hint=" "} },
      { u.lua_lsp_status, color = { fg = "#fff" } }
    },
    lualine_y = { "filetype" },
    lualine_z = { "progress" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {"filename"},
    lualine_x = {"progress"},
    lualine_y = {},
    lualine_z = {},
  }
})
