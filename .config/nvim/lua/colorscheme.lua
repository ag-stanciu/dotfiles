--Set colorscheme (order is important here)
vim.opt.termguicolors = true

local M = {}
-- custom colors
local colors = {
    -- bg = "#2e3440",
    bg = "#1e222a",
    fg = "#ECEFF4",
    red = "#bf616a",
    orange = "#d08770",
    yellow = "#ebcb8b",
    blue = "#5e81ac",
    green = "#a3be8c",
    cyan = "#88c0d0",
    magenta = "#b48ead",
    pink = "#FFA19F",
    grey1 = "#f8fafc",
    grey2 = "#f0f1f4",
    grey3 = "#eaecf0",
    grey4 = "#d9dce3",
    grey5 = "#c4c9d4",
    grey6 = "#b5bcc9",
    grey7 = "#929cb0",
    grey8 = "#8e99ae",
    grey9 = "#74819a",
    grey10 = "#616d85",
    grey11 = "#464f62",
    grey12 = "#3a4150",
    grey13 = "#333a47",
    grey14 = "#242932",
    grey15 = "#1e222a",
    grey16 = "#1c1f26",
    grey17 = "#0f1115",
    grey18 = "#0d0e11",
    grey19 = "#020203",
}


-- colors
-- vim.g.onedark_terminal_italics = 2
-- vim.g.tokyonight_style = "night"
-- vim.cmd [[colorscheme tokyonight]]

-- vim.cmd[[colorscheme gruvbox-flat]]
-- vim.cmd[[colorscheme nordfox]]
-- vim.g.everforest_background = 'hard'
-- vim.cmd[[colorscheme everforest]]

-- one dark pro
-- local od = require('onedarkpro')
-- od.setup({
--   colors = {
--     bg = '#1e222a',
--     brackets = "#abb2bf", -- fg / gray
--     cursorline = "#2e323b",
--     indentline = "#3c414d",
--
--     statusline_div = "#2e323b", -- gray
--     statusline_bg = "#2e323b", -- gray
--     statusline_text = "#696C77", -- gray
--   },
--   options = {
--     cursorline = true,
--   }
-- })
-- od.load()

-- one nord
require('onenord').setup({
  custom_colors = {
    bg = '#1e222a',
    brackets = "#abb2bf", -- fg / gray
    cursorline = "#2e323b",
    indentline = "#3c414d",

    statusline_div = "#2e323b", -- gray
    statusline_bg = colors.bg, -- "#2e323b", -- gray
    statusline_text = "#696C77", -- gray
  },
  borders = true,
  fade_nc = false,
  styles = {
      comments = "italic",
      diagnostics = "NONE",
  },
  disable = {
      background = false,
      cursorline = false,
      eob_lines = true,
  },
  custom_highlights = {
      VertSplit = { fg = colors.grey14 },
      BufferLineIndicatorSelected = { fg = colors.cyan, bg = colors.bg },
      BufferLineFill = { fg = colors.fg, bg = colors.bg },
      NvimTreeNormal = { fg = colors.grey5, bg = colors.grey14 },
      WhichKeyFloat = { bg = colors.grey14 },
      GitSignsAdd = { fg = colors.green },
      GitSignsChange = { fg = colors.orange },
      GitSignsDelete = { fg = colors.red },
      NvimTreeFolderIcon = { fg = colors.grey9 },
      NvimTreeIndentMarker = { fg = colors.grey12 },

      NormalFloat = { bg = colors.grey14 },
      FloatBorder = { bg = colors.grey14, fg = colors.grey14 },

      -- TelescopePromptPrefix = { bg = colors.grey14 },
      -- TelescopePromptNormal = { bg = colors.grey14 },
      -- TelescopeResultsNormal = { bg = colors.grey15 },
      -- TelescopePreviewNormal = { bg = colors.grey16 },
      --
      -- TelescopePromptBorder = { bg = colors.grey14, fg = colors.grey14 },
      -- TelescopeResultsBorder = { bg = colors.grey15, fg = colors.grey15 },
      -- TelescopePreviewBorder = { bg = colors.grey16, fg = colors.grey16 },
      --
      -- TelescopePromptTitle = { fg = colors.grey14 },
      -- TelescopeResultsTitle = { fg = colors.grey15 },
      -- TelescopePreviewTitle = { fg = colors.grey16 },

      PmenuSel = { bg = colors.grey12 },
      Pmenu = { bg = colors.grey14 },
      PMenuThumb = { bg = colors.grey16 },

      LspFloatWinNormal = { fg = colors.fg, bg = colors.grey14 },
      LspFloatWinBorder = { fg = colors.grey14 },
  },
})

-- vim.cmd[[colorscheme rasmus]]
-- vim.cmd[[colorscheme substrata]]

-- kanagawa
-- vim.cmd[[colorscheme kanagawa]]

-- gruvbox
-- vim.g.gruvbox_material_palette = 'original'
-- vim.g.gruvbox_material_background = 'hard'
-- vim.cmd[[colorscheme gruvbox-material]]

M.colors = colors
return M
