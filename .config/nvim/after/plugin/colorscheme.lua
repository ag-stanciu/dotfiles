--Set colorscheme (order is important here)
vim.opt.termguicolors = true

-- colors
-- vim.g.onedark_terminal_italics = 2
-- vim.g.tokyonight_style = "night"
-- vim.cmd [[colorscheme tokyonight]]

-- vim.g.onedark_style = 'darker'
-- vim.cmd[[colorscheme onedark]]

-- vim.cmd[[colorscheme nord]]

-- vim.cmd[[colorscheme gruvbox-flat]]
-- vim.cmd[[colorscheme nightfox]]
-- vim.g.everforest_background = 'hard'
-- vim.cmd[[colorscheme everforest]]

local od = require('onedarkpro')
od.setup({
  colors = {
    bg = '#1e222a'
  }
})
od.load()
