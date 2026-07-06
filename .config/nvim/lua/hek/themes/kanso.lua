local M = {}

M.load = function()
    local kanso =  require("kanso")
    kanso.setup({
        transparent = true,
        palette = "ink",
    })
    local pallete = require("kanso.colors").setup({ theme = "ink" })
    local colorscheme = pallete.palette
    local colors = vim.tbl_deep_extend("force", colorscheme, {
        statusline_bg = colorscheme.inkBlack0,
        statusline_div = colorscheme.inkBlack0,
        statusline_text = colorscheme.inkBlack0,
        grey9 = colorscheme.inkGray,
        dark_red = colorscheme.inkRed,
        bg_dark = colorscheme.inkBlack0,
        bg = colorscheme.inkBlack0,
        -- gray = colorscheme.terminal_black,
    })
    vim.cmd("colorscheme kanso")

    return colors
end

return M
