local M = {}

M.load = function()
    require("kanagawa-paper").setup({
        transparent = true,
        undercurl = false,
        overrides = function(colors)
            local palette = colors.theme.ui
            local rainbow = colors.theme.rainbow
            return {

                TelescopeNormal = { bg = palette.bg_m3 },
                TelescopePromptNormal = { bg = palette.bg_m3, },
                TelescopeResultsNormal = { bg = palette.bg_m3, },
                TelescopePreviewNormal = { bg = palette.bg_m3, },
                --
                -- -- Selection.
                TelescopeSelection = { bg = palette.bg_m1, fg = palette.fg, bold = true, },
                TelescopeSelectionCaret = { fg = rainbow.rainbow3, bg = palette.bg_m1, bold = true },
                --
                -- -- Titles.
                TelescopePreviewTitle = { bg = rainbow.rainbow3, fg = palette.bg_m3, bold = true, },
                TelescopeResultsTitle = { bg = rainbow.rainbow3, fg = palette.bg_m3, bold = true, },
                TelescopePromptTitle = { bg = rainbow.rainbow3, fg = palette.bg_m3, bold = true, },
                TelescopeTitle = { bg = rainbow.rainbow4, fg = palette.bg_m3, bold = true, },
                --
                TelescopeBorder = { fg = palette.fg, bg = palette.bg_m3, },
                TelescopePromptBorder = { bg = palette.bg_m3, fg = rainbow.rainbow3, },
                TelescopeResultsBorder = { bg = palette.bg_m3, fg = rainbow.rainbow3, },
                TelescopePreviewBorder = { bg = palette.bg_m3, fg = rainbow.rainbow3, },
                --
                TelescopePromptPrefix = { bg = palette.bg_m3, fg = rainbow.rainbow3, },
                --
                PopupNormal = { bg = palette.bg_m3, },
                PopupBorder = { bg = palette.bg_m3, fg = rainbow.rainbow3, },
                NormalFloat = { bg = palette.bg_m3, },
                FloatBorder = { bg = palette.bg_m3, fg = rainbow.rainbow3 },

                Pmenu = { fg = palette.shade0, bg = palette.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
                PmenuSel = { fg = "NONE", bg = palette.bg_p2 },
                PmenuSbar = { bg = palette.bg_m1 },
                PmenuThumb = { bg = palette.bg_p2 },
                -- NormalFloat = { bg = "none" },
                -- FloatBorder = { bg = "none" },
                FloatTitle = { bg = "none" },

                -- Save a hlgroup with dark background and dimmed foreground
                -- so that you can use it where you still want darker windows.
                -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
                -- NormalDark = { fg = palette.fg_dim, bg = palette.bg_m3 },

                -- Popular plugins that open floats will link to NormalFloat by default;
                -- set their background accordingly if you wish to keep them dark and borderless
                LazyNormal = { bg = palette.bg_m3 },
                MasonNormal = { bg = palette.bg_m3 },
            }
        end
    })
    vim.cmd("colorscheme kanagawa-paper")
    local colorscheme = require("kanagawa-paper.colors").setup().theme
    local colors = vim.tbl_deep_extend("force", colorscheme, {
        bg_dark = colorscheme.ui.bg,
        bg = colorscheme.ui.bg,
        -- gray = colorscheme.terminal_black,
    })

    return colors
end

return M
