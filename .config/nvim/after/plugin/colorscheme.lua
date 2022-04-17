--Set colorscheme (order is important here)
vim.opt.termguicolors = true

-- colors
-- vim.g.onedark_terminal_italics = 2
-- vim.g.tokyonight_style = "night"
-- vim.cmd [[colorscheme tokyonight]]

-- Lua
-- require('onedark').setup {
--     style = 'darker'
-- }
-- require('onedark').load()

-- vim.cmd[[colorscheme onenord]]

-- vim.cmd[[colorscheme gruvbox-flat]]
-- vim.cmd[[colorscheme nightfox]]
-- vim.g.everforest_background = 'hard'
-- vim.cmd[[colorscheme everforest]]

-- one dark pro
local od = require('onedarkpro')
od.setup({
  colors = {
    bg = '#1e222a',
  },
  options = {
    cursorline = true,
  }
})
od.load()

-- one nord
-- require('onenord').setup()

-- tokyo & gruvbox
-- vim.cmd[[colorscheme kanagawa]]
