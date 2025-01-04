local M = {}

M.load = function()
    require("poimandres").setup({
        -- style = "storm",
        transparent = true,
    })
    local colorscheme = require("poimandres.colors").setup({
        -- style = "storm",
        transparent = "true"
    })
    local colors = vim.tbl_deep_extend("force", colorscheme, {
        statusline_bg = colorscheme.bg,
        statusline_div = colorscheme.bg,
        statusline_text = colorscheme.fg,
        grey9 = colorscheme.darkerGray,
        dark_red = colorscheme.hotRed,
        bg_dark = colorscheme.focus,
        bg = colorscheme.bg,
        -- gray = colorscheme.terminal_black,
    })
    vim.cmd("colorscheme poimandres")

    return colors
end

return M
