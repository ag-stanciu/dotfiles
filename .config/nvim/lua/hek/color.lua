local ok, tokyo = pcall(require, 'tokyonight')
if not ok then
    return
end

local M = {}

-- colors
tokyo.setup({
    style = "night"
})
local colorscheme = require("tokyonight.colors").setup()
local util = require("tokyonight.util")

local grey9 = util.darken(colorscheme.bg_highlight, 0.5)
local dark_red = util.darken(colorscheme.red, 0.5)

local colors = vim.tbl_deep_extend("force", colorscheme, {
    statusline_bg = colorscheme.bg_statusline,
    statusline_div = colorscheme.bg_statusline,
    statusline_text = colorscheme.fg,
    gray = colorscheme.terminal_black,
    grey9 = grey9,
    dark_red = dark_red,
})
vim.cmd('colorscheme tokyonight-night')

M.colors = colors
return M
