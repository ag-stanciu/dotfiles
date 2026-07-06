local M = {}

M.load = function()
    -- everforest
    require("everforest").setup({
        background = "medium",
        transparent_background_level = 2,
        float_style = "dim",
        on_highlights = function(hl, c)
            -- hl.TelescopePromptNormal = { bg = c.bg0, }
            -- hl.TelescopeResultsNormal = { bg = c.bg_dim, }
            -- hl.TelescopePreviewNormal = { bg = c.bg_dim, }
            --
            -- --     -- Selection.
            -- hl.TelescopeSelection = { bg = c.bg2, fg = c.fg, bold = true, }
            -- hl.TelescopeSelectionCaret = { fg = c.blue, bg = c.bg2, bold = true }
            --
            -- -- Titles.
            -- hl.TelescopePreviewTitle = { bg = c.blue, fg = c.grey0, bold = true, }
            -- hl.TelescopeResultsTitle = { bg = c.blue, fg = c.grey0, bold = true, }
            -- hl.TelescopePromptTitle = { bg = c.blue, fg = c.grey0, bold = true, }
            -- hl.TelescopeTitle = { bg = c.orange, fg = c.grey0, bold = true, }
            --
            -- -- Borders.
            -- hl.TelescopeBorder = { fg = c.blue, bg = c.bg1, }
            -- hl.TelescopePromptBorder = { bg = c.bg0, fg = c.blue, }
            -- hl.TelescopeResultsBorder = { bg = c.bg_dim, fg = c.blue, }
            -- hl.TelescopePreviewBorder = { bg = c.bg_dim, fg = c.blue, }
            --
            -- -- Misc.
            -- hl.TelescopePromptPrefix = { bg = c.bg0, fg = c.blue, }
            --
            -- hl.PopupNormal = { bg = c.bg_dim, }
            -- hl.PopupBorder = { bg = c.bg_dim, fg = c.blue, }
            -- hl.NormalFloat = { bg = c.bg_dim, }
            -- hl.FloatBorder = { bg = c.bg_dim, fg = c.blue }
            -- --
            -- hl.Pmenu = { link = 'PopupNormal' }
            -- hl.PmenuSel = { bg = c.bg_blue }
            -- hl.PmenuBorder = { link = 'PopupBorder' }
            -- hl.PmenuDocBorder = { bg = c.bg_dim, fg = c.blue }

            -- hl.Pmenu = { link = 'PopupNormal' }
            -- hl.PmenuSel = { bg = palette.blue }
            -- hl.PmenuBorder = { link = 'PopupBorder' }
            -- hl.PmenuDocBorder = { bg = palette.bg, fg = palette.blue }


            -- hl.CmpItemAbbrDeprecated = { fg = palette.comment, bg = "NONE", strikethrough = true }
            -- hl.CmpItemAbbrMatch = { fg = palette.blue, bg = "NONE", bold = true }
            -- hl.CmpItemAbbrMatchFuzzy = { fg = palette.blue, bg = "NONE", bold = true }
            -- hl.CmpItemMenu = { fg = palette.purple, bg = "NONE", italic = true }
            --
            -- hl.CmpItemKindField = { fg = palette.fg, bg = palette.red }
            -- hl.CmpItemKindProperty = { fg = palette.fg, bg = palette.red }
            -- hl.CmpItemKindEvent = { fg = palette.fg, bg = palette.red }
            --
            -- hl.CmpItemKindText = { fg = palette.fg, bg = palette.green }
            -- hl.CmpItemKindEnum = { fg = palette.fg, bg = palette.green }
            -- hl.CmpItemKindKeyword = { fg = palette.fg, bg = palette.green }
            --
            -- hl.CmpItemKindConstant = { fg = palette.fg, bg = palette.magenta }
            -- hl.CmpItemKindConstructor = { fg = palette.fg, bg = palette.magenta }
            -- hl.CmpItemKindReference = { fg = palette.fg, bg = palette.magenta }
            --
            -- hl.CmpItemKindFunction = { fg = palette.fg, bg = palette.purple }
            -- hl.CmpItemKindStruct = { fg = palette.fg, bg = palette.purple }
            -- hl.CmpItemKindClass = { fg = palette.fg, bg = palette.purple }
            -- hl.CmpItemKindModule = { fg = palette.fg, bg = palette.purple }
            -- hl.CmpItemKindOperator = { fg = palette.fg, bg = palette.purple }
            --
            -- hl.CmpItemKindVariable = { fg = palette.fg_dark, bg = palette.dark3 }
            -- hl.CmpItemKindFile = { fg = palette.fg_dark, bg = palette.dark3 }
            --
            -- hl.CmpItemKindUnit = { fg = palette.fg, bg = palette.yellow }
            -- hl.CmpItemKindSnippet = { fg = palette.fg, bg = palette.yellow }
            -- hl.CmpItemKindFolder = { fg = palette.fg, bg = palette.yellow }
            --
            -- hl.CmpItemKindMethod = { fg = palette.fg, bg = palette.blue }
            -- hl.CmpItemKindValue = { fg = palette.fg, bg = palette.blue }
            -- hl.CmpItemKindEnumMember = { fg = palette.fg, bg = palette.blue }
            --
            -- hl.CmpItemKindInterface = { fg = palette.fg, bg = palette.blue }
            -- hl.CmpItemKindColor = { fg = palette.fg, bg = palette.blue }
            -- hl.CmpItemKindTypeParameter = { fg = palette.fg, bg = palette.blue }
        end,
    })
    vim.cmd("colorscheme everforest")
    local conf = require("everforest").config
    local colorscheme = require("everforest.colours").generate_palette(conf, "dark")
    -- vim.print(vim.inspect(colorscheme))
    local colors = vim.tbl_deep_extend("force", colorscheme, {
        -- bg = colorscheme.bg0,
        statusline_bg = colorscheme.bg0,
        statusline_div = colorscheme.bg0,
        statusline_text = colorscheme.fg,
        grey9 = colorscheme.grey0,
        dark_red = colorscheme.statusline3,
        bg_dark = colorscheme.bg_dim,
        -- gray = colorscheme.terminal_black,
    })

    return colors
end

return M
