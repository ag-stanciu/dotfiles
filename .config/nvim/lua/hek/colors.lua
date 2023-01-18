local ok, tokyo = pcall(require, 'tokyonight')
if not ok then
    return
end

local M = {}

-- colors
tokyo.setup({
    style = "night"
})
local colors = require("tokyonight.colors").setup() -- pass in any of the config options as explained above
local util = require("tokyonight.util")
colors.statusline_bg = colors.bg_statusline
colors.statusline_div = colors.bg_statusline
colors.statusline_text = colors.fg
colors.gray = colors.terminal_black
colors.grey9 = util.darken(colors.gray, 0.5)
colors.dark_red = util.darken(colors.red, 0.5)
vim.cmd('colorscheme tokyonight-night')

M.colors = colors
return M
