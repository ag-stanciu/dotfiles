local M = {}

M.load = function()
    local shd =  require("shadow")
    shd.setup()
    local colorscheme = shd.colors
    local colors = vim.tbl_deep_extend("force", colorscheme, {
        statusline_bg = colorscheme.bg.gui,
        statusline_div = colorscheme.bg.gui,
        statusline_text = colorscheme.fg.gui,
        grey9 = colorscheme.black_bright.gui,
        dark_red = colorscheme.red.gui,
        bg_dark = colorscheme.black.gui,
        bg = colorscheme.bg.gui,
        -- gray = colorscheme.terminal_black,
    })
    vim.cmd("colorscheme shadow")

    return colors
end

return M
