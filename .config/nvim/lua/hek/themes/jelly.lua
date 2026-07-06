local M = {}

M.load = function()
    local jelly =  require("jellybeans")
    jelly.setup({
        transparent = true,
        palette = "jellybeans-muted",
        plugins = {
            auto = true
        }
    })
    local pallete = require("jellybeans.palettes")
    local colorscheme = pallete.get_palette("jellybeans-muted", { style = '' })
    local colors = vim.tbl_deep_extend("force", colorscheme, {
        statusline_bg = colorscheme.background,
        statusline_div = colorscheme.background,
        statusline_text = colorscheme.foreground,
        grey9 = colorscheme.gray,
        dark_red = colorscheme.red,
        bg_dark = colorscheme.background,
        bg = colorscheme.background
        -- gray = colorscheme.terminal_black,
    })
    vim.cmd("colorscheme jellybeans-muted")

    return colors
end

return M
