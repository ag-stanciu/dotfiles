local ok, tokyo = pcall(require, 'tokyonight')
if not ok then
    return
end

local M = {}

-- colors
tokyo.setup({
    style = "night",
    -- transparent = true,
    styles = {
        floats = "transparent"
    }
})
local colorscheme = require("tokyonight.colors").setup()
local util = require("tokyonight.util")
local grey9 = util.darken(colorscheme.bg_highlight, 0.5)
local dark_red = util.darken(colorscheme.red, 0.5)
vim.cmd("colorscheme tokyonight-night")

-- require("onenord").setup({
--     custom_colors = {
--         bg = "#1e222a",
--     }
-- })
-- local colorscheme = require("onenord.colors").load()
-- local grey9 = colorscheme.light_gray
-- local dark_red = colorscheme.dark_red

local colors = vim.tbl_deep_extend("force", colorscheme, {
    statusline_bg = colorscheme.bg_statusline,
    statusline_div = colorscheme.bg_statusline,
    statusline_text = colorscheme.fg,
    grey9 = grey9,
    dark_red = dark_red,
    -- bg_dark = "#2e3440",
    -- gray = colorscheme.terminal_black,
})

M.colors = colors
return M
