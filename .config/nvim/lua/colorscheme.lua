--Set colorscheme (order is important here)
vim.opt.termguicolors = true

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
    statusline_bg = "#2e323b", -- gray
    statusline_text = "#696C77", -- gray
  },
  styles = {
    diagnostics = 'NONE',
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
